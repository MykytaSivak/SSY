# IoT Senzor: LoRaWAN Chytrá závora a Meteostanice

Tento projekt demonstruje využití mikrokontroléru STM32 pro čtení dat ze senzorů a jejich odesílání přes síť LoRaWAN (CRA IoT platforma). Zařízení slouží jako chytrá závora detekující průjezd a zároveň měří teplotu a atmosférický tlak.

## Hardware
* **Mikrokontrolér:** STM32 (s podporou LoRaWAN)
* **Senzor prostředí:** BMP180 (Teplota a Tlak) - komunikace přes I2C
* **Detektor překážky:** Infračervený (IR) senzor - digitální vstup (GPIO)

## Funkcionalita
Zařízení se po spuštění připojí do sítě LoRaWAN. V pravidelných intervalech (nebo po stisknutí tlačítka) provede následující akce:
1. Přečte stav IR senzoru (0 = Překážka, 1 = Volno).
2. Vyčte aktuální teplotu a tlak ze senzoru BMP180.
3. Připraví a optimalizuje data do 5bajtového paketu.
4. Odešle data (Uplink) přes LoRaWAN na portu 2 do platformy CRA.

### Formát odesílaných dat (Payload)
Data jsou před odesláním komprimována do 5 bajtů, aby se minimalizovala doba vysílání (Airtime) a šetřila baterie.
* **Byte 0:** Stav závory (`0x00` = Překážka, `0x01` = Volno)
* **Byte 1-2:** Teplota v °C vynásobená 10 (16-bit signed integer)
* **Byte 3-4:** Tlak v Pa vydělený 10 (16-bit unsigned integer)

## Příjem dat (MQTTX)
Data z CRA Gatewaye odebíráme pomocí protokolu MQTT. Pro zobrazení dat v lidsky čitelné podobě v klientovi **MQTTX** používáme následující JavaScriptový dekodér.

### Instalace dekodéru do MQTTX:
1. V MQTTX otevřete sekci **Scripts** a vytvořte nový skript.
2. Vložte kód níže a uložte.
3. V nastavení vašeho připojení (Connections) vyberte tento skript v rozbalovacím menu "Script" nahoře. Nastavte zobrazování zpráv na **Plaintext**.

```javascript
/**
 * MQTTX Decoder pro CRA IoT Gateway (LoRaWAN)
 */
function handlePayload(payload) {
  let obj;
  if (typeof payload === 'object') {
    obj = payload;
  } else {
    try {
      obj = JSON.parse(payload);
    } catch (e) {
      return payload; 
    }
  }

  // Zpracování dat ze senzoru
  if (obj && obj.EUI && typeof obj.data === 'string') {
    try {
      let hex = obj.data;
      let bytes = [];
      for (let c = 0; c < hex.length; c += 2) {
        bytes.push(parseInt(hex.substr(c, 2), 16));
      }

      if (bytes.length >= 5) {
        let irText = (bytes[0] === 0) ? "!!! PŘEKÁŽKA (ZAVŘENO) !!!" : "VOLNO (PRŮJEZD OK)";

        let tempRaw = (bytes[1] << 8) | bytes[2];
        if (tempRaw > 0x7FFF) tempRaw -= 0x10000;
        let temperature = (tempRaw / 10.0).toFixed(1);

        let pressureRaw = (bytes[3] << 8) | bytes[4];
        let pressureHpa = (pressureRaw / 10.0).toFixed(1);

        let devEUI = obj.EUI;
        let cas = obj.ts ? new Date(obj.ts).toLocaleString('cs-CZ') : "Neznámý";

        let vystup = `--- LORA REPORT [${devEUI}] ---\n`;
        vystup += `ČAS: ${cas}\n`;
        vystup += `-----------------------------------\n`;
        vystup += `STAV ZÁVORY: ${irText}\n`;
        vystup += `TEPLOTA    : ${temperature} °C\n`;
        vystup += `TLAK       : ${pressureHpa} hPa\n`;
        vystup += `-----------------------------------`;

        return vystup;
      }
    } catch (err) {
      return typeof payload === 'object' ? JSON.stringify(payload, null, 2) : payload;
    }
  }
  return typeof payload === 'object' ? JSON.stringify(payload, null, 2) : payload;
}

execute(handlePayload);
