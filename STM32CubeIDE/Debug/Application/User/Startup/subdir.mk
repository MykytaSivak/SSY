################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../Application/User/Startup/startup_stm32wl55jcix.s 

OBJS += \
./Application/User/Startup/startup_stm32wl55jcix.o 

S_DEPS += \
./Application/User/Startup/startup_stm32wl55jcix.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/Startup/%.o: ../Application/User/Startup/%.s Application/User/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -DSX126X -DNUMBER_OF_STACKS=1 -DENDNODE -c -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lorawan_api -I"D:/xsivak03/LoRaWAN_End_Node_LBM/Core/Inc" -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lr1mac -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lr1mac/src -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/smtc_ral/src -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/smtc_modem_crypto/smtc_modem_element -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/lr1mac/src/smtc_real/src -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/radio_planner/src -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/smtc_ralf/src -I../../Middlewares/Third_Party/LoRaWAN/smtc_modem_core/modem_utilities -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-Application-2f-User-2f-Startup

clean-Application-2f-User-2f-Startup:
	-$(RM) ./Application/User/Startup/startup_stm32wl55jcix.d ./Application/User/Startup/startup_stm32wl55jcix.o

.PHONY: clean-Application-2f-User-2f-Startup

