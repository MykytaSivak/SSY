# IoT Senzor: LoRaWAN Chytrá závora a Meteostanice

Firmware pro STM32WL55 (NUCLEO-WL55JC) implementující IoT zařízení, které detekuje průjezd pomocí IR senzoru a zároveň měří teplotu a atmosferický tlak. Data jsou odesílána přes síť **LoRaWAN** na platformu **CRA IoT**.

---

## Hardware

| Komponenta | Popis |
|---|---|
| **MCU** | STM32WL55 (NUCLEO-WL55JC1 / JC2) |
| **Senzor prostředí** | BMP180 – teplota a tlak, I2C |
| **Detektor překážky** | IR senzor – digitální GPIO vstup |
| **Komunikace** | Integrovaný Sub-GHz LoRa rádio (STM32WL) |

---

## Funkce

Po připojení do sítě LoRaWAN zařízení v pravidelných intervalech (nebo po stisku tlačítka USER1) provede:

1. Přečte stav IR senzoru (`0` = překážka, `1` = volno)
2. Změří teplotu a tlak ze senzoru BMP180 přes I2C
3. Zakóduje data do kompaktního **5bajtového payloadu**
4. Odešle Uplink paket na **LoRaWAN port 2** do CRA platformy

---

## Formát payloadu (5 bajtů)

Data jsou komprimována, aby se minimalizoval airtime a šetřila baterie.

| Byte | Obsah | Kódování |
|------|-------|----------|
| `0` | Stav závory | `0x00` = Překážka, `0x01` = Volno |
| `1–2` | Teplota | 16bit signed int, hodnota × 10 (°C) |
| `3–4` | Tlak | 16bit unsigned int, hodnota ÷ 10 (Pa → hPa) |

**Příklad:** `01 00 F5 26 AC` → Volno, 24.5 °C, 994.0 hPa

---

## Sestavení a nahrání

### Požadavky

- [STM32CubeIDE](https://www.st.com/en/development-tools/stm32cubeide.html) nebo IAR EWARM
- STM32WL55 Nucleo board
- USB kabel (Type-A na micro-B) pro ST-LINK

### Postup

1. Naklonuj repozitář:
   ```bash
   git clone https://github.com/MykytaSivak/SSY.git
   ```
2. Otevři projekt v **STM32CubeIDE** (složka `STM32CubeIDE/`) nebo **IAR EWARM** (složka `EWARM/`).
3. Nastav LoRaWAN klíče v souboru `LoRaWAN/App/se-identity.h`:
   - `DevEUI`, `JoinEUI` (AppEUI), `AppKey`
4. Zkontroluj region v `LoRaWAN/App/lora_app.h` (pro CZ: `LORAMAC_REGION_EU868`)
5. Sestav projekt (**Build All**) a nahraj do zařízení (**Debug / Run**).
6. Sleduj výstup přes UART: **115200 baud, 8N1**, bez flow control.

### Debugování

V `Core/Inc/sys_conf.h` nastav:
```c
#define DEBUGGER_ENABLED    1
#define LOW_POWER_DISABLE   1
```

---

## Příjem dat přes MQTT (MQTTX)

Data z CRA gateway odebíráme přes protokol MQTT. Pro čitelný výstup v klientovi **MQTTX** použij níže uvedený JavaScript dekodér.

### Instalace dekodéru

1. V MQTTX otevři sekci **Scripts** a vytvoř nový skript.
2. Vlož kód níže a ulož.
3. V nastavení připojení vyber tento skript v menu „Script" a nastav zobrazení na **Plaintext**.

```javascript
/**
 * MQTTX Decoder pro CRA IoT Gateway (LoRaWAN)
 * Dekóduje 5bajtový payload ze závory + meteostanice
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
```

---

## Struktura projektu

```
SSY/
├── Core/               # HAL, GPIO, I2C, UART, RTC, ADC, senzory
├── LoRaWAN/
│   ├── App/            # Aplikační logika LoRaWAN, Commissioning, klíče
│   └── Target/         # Konfigurace rádia a middleware
├── Drivers/            # STM32 HAL a BSP ovladače
├── Middlewares/        # LoRaWAN stack (LBM)
├── STM32CubeIDE/       # Projektové soubory pro STM32CubeIDE
├── EWARM/              # Projektové soubory pro IAR EWARM
├── MDK-ARM/            # Projektové soubory pro Keil MDK
└── LoRaWAN_End_Node_LBM.ioc  # STM32CubeMX konfigurace
```

---

## Licence

Firmware vychází ze šablony STMicroelectronics (`LoRaWAN_End_Node_LBM`).  
© 2020–2021 STMicroelectronics – viz `readme.txt` pro podmínky použití.
