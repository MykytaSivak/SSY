################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
D:/xsivak03/LoRaWAN_End_Node_LBM/Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_services/lfu_service/file_upload.c 

OBJS += \
./Middlewares/LoRaWAN/smtc_modem_core/modem_services/lfu_service/file_upload.o 

C_DEPS += \
./Middlewares/LoRaWAN/smtc_modem_core/modem_services/lfu_service/file_upload.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/LoRaWAN/smtc_modem_core/modem_services/lfu_service/file_upload.o: D:/xsivak03/LoRaWAN_End_Node_LBM/Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_services/lfu_service/file_upload.c Middlewares/LoRaWAN/smtc_modem_core/modem_services/lfu_service/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DCORE_CM4 -DUSE_HAL_DRIVER -DSTM32WL55xx -DNUMBER_OF_STACKS=1 -DSX126X -DENDNODE -c -I../../Core/Inc -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lr1mac/src/lr1mac_class_b -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lr1mac/src/lr1mac_class_c -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_services -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_services/stream_packages -I../../LoRaWAN/App -I../../LoRaWAN/Target -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Utilities/trace/adv_trace -I../../Utilities/misc -I../../Utilities/sequencer -I../../Utilities/timer -I../../Utilities/lpm/tiny_lpm -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_api -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_services/service_template -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_services/relay_service -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_services/lfu_service -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_services/store_and_forward -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lr1mac -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lr1mac/src -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lr1mac/src/smtc_real/src -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lr1mac/src/services -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lorawan_api -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lorawan_manager -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_hal -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/smtc_modem_crypto/ -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/smtc_modem_crypto/smtc_secure_element -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lorawan_packages/lorawan_certification -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_supervisor -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_utilities -I../../Middlewares/Third_Party/SubGHz_Phy/lorawan -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../Middlewares/Third_Party/SubGHz_Phy/lorawan/radio_drivers/sx126x_driver/src -I../../Middlewares/Third_Party/SubGHz_Phy/lorawan/smtc_ralf/src -I../../Middlewares/Third_Party/SubGHz_Phy/lorawan/smtc_ral/src -I../../Middlewares/Third_Party/SubGHz_Phy/lorawan/radio_planner/src -Og -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Middlewares-2f-LoRaWAN-2f-smtc_modem_core-2f-modem_services-2f-lfu_service

clean-Middlewares-2f-LoRaWAN-2f-smtc_modem_core-2f-modem_services-2f-lfu_service:
	-$(RM) ./Middlewares/LoRaWAN/smtc_modem_core/modem_services/lfu_service/file_upload.cyclo ./Middlewares/LoRaWAN/smtc_modem_core/modem_services/lfu_service/file_upload.d ./Middlewares/LoRaWAN/smtc_modem_core/modem_services/lfu_service/file_upload.o ./Middlewares/LoRaWAN/smtc_modem_core/modem_services/lfu_service/file_upload.su

.PHONY: clean-Middlewares-2f-LoRaWAN-2f-smtc_modem_core-2f-modem_services-2f-lfu_service

