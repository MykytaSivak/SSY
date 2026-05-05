################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (13.3.rel1)
################################################################################

-include ../makefile.init

RM := rm -rf

# All of the sources participating in the build are defined here
-include sources.mk
-include Utilities/subdir.mk
-include Middlewares/SubGHz_Phy/lorawan/smtc_ralf/src/subdir.mk
-include Middlewares/SubGHz_Phy/lorawan/smtc_ral/src/subdir.mk
-include Middlewares/SubGHz_Phy/lorawan/radio_planner/src/subdir.mk
-include Middlewares/SubGHz_Phy/lorawan/radio_drivers/sx126x_driver/src/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/smtc_modem_crypto/soft_secure_element/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/smtc_modem_crypto/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/modem_utilities/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/modem_supervisor/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/modem_services/store_and_forward/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/modem_services/service_template/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/modem_services/relay_service/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/modem_services/lfu_service/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/modem_services/beacon_tx_service/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lr1mac/src/smtc_real/src/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lr1mac/src/services/smtc_multicast/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lr1mac/src/services/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lr1mac/src/relay/relay_tx/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lr1mac/src/relay/relay_rx/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lr1mac/src/relay/common/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lr1mac/src/lr1mac_class_c/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lr1mac/src/lr1mac_class_b/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lr1mac/src/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lorawan_packages/lorawan_certification/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lorawan_manager/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/lorawan_api/subdir.mk
-include Middlewares/LoRaWAN/smtc_modem_core/subdir.mk
-include Drivers/STM32WLxx_HAL_Driver/subdir.mk
-include Drivers/CMSIS/subdir.mk
-include Drivers/BSP/STM32WLxx_Nucleo/subdir.mk
-include Application/User/Startup/subdir.mk
-include Application/User/LoRaWAN/Target/subdir.mk
-include Application/User/LoRaWAN/App/subdir.mk
-include Application/User/Core/subdir.mk
-include objects.mk

ifneq ($(MAKECMDGOALS),clean)
ifneq ($(strip $(S_DEPS)),)
-include $(S_DEPS)
endif
ifneq ($(strip $(S_UPPER_DEPS)),)
-include $(S_UPPER_DEPS)
endif
ifneq ($(strip $(C_DEPS)),)
-include $(C_DEPS)
endif
endif

-include ../makefile.defs

OPTIONAL_TOOL_DEPS := \
$(wildcard ../makefile.defs) \
$(wildcard ../makefile.init) \
$(wildcard ../makefile.targets) \


BUILD_ARTIFACT_NAME := LoRaWAN_End_Node_LBM
BUILD_ARTIFACT_EXTENSION := elf
BUILD_ARTIFACT_PREFIX :=
BUILD_ARTIFACT := $(BUILD_ARTIFACT_PREFIX)$(BUILD_ARTIFACT_NAME)$(if $(BUILD_ARTIFACT_EXTENSION),.$(BUILD_ARTIFACT_EXTENSION),)

# Add inputs and outputs from these tool invocations to the build variables 
EXECUTABLES += \
LoRaWAN_End_Node_LBM.elf \

MAP_FILES += \
LoRaWAN_End_Node_LBM.map \

SIZE_OUTPUT += \
default.size.stdout \

OBJDUMP_LIST += \
LoRaWAN_End_Node_LBM.list \


# All Target
all: main-build

# Main-build Target
main-build: LoRaWAN_End_Node_LBM.elf secondary-outputs

# Tool invocations
LoRaWAN_End_Node_LBM.elf LoRaWAN_End_Node_LBM.map: $(OBJS) $(USER_OBJS) D:\xsivak03\LoRaWAN_End_Node_LBM\STM32CubeIDE\STM32WL55JCIX_FLASH.ld makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-gcc -o "LoRaWAN_End_Node_LBM.elf" @"objects.list" $(USER_OBJS) $(LIBS) -mcpu=cortex-m4 -T"D:\xsivak03\LoRaWAN_End_Node_LBM\STM32CubeIDE\STM32WL55JCIX_FLASH.ld" --specs=nosys.specs -Wl,-Map="LoRaWAN_End_Node_LBM.map" -Wl,--gc-sections -static --specs=nano.specs -mfloat-abi=soft -mthumb -Wl,--start-group -lc -lm -Wl,--end-group
	@echo 'Finished building target: $@'
	@echo ' '

default.size.stdout: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-size  $(EXECUTABLES)
	@echo 'Finished building: $@'
	@echo ' '

LoRaWAN_End_Node_LBM.list: $(EXECUTABLES) makefile objects.list $(OPTIONAL_TOOL_DEPS)
	arm-none-eabi-objdump -h -S $(EXECUTABLES) > "LoRaWAN_End_Node_LBM.list"
	@echo 'Finished building: $@'
	@echo ' '

# Other Targets
clean:
	-$(RM) LoRaWAN_End_Node_LBM.elf LoRaWAN_End_Node_LBM.list LoRaWAN_End_Node_LBM.map default.size.stdout
	-@echo ' '

secondary-outputs: $(SIZE_OUTPUT) $(OBJDUMP_LIST)

fail-specified-linker-script-missing:
	@echo 'Error: Cannot find the specified linker script. Check the linker settings in the build configuration.'
	@exit 2

warn-no-linker-script-specified:
	@echo 'Warning: No linker script specified. Check the linker settings in the build configuration.'

.PHONY: all clean dependents main-build fail-specified-linker-script-missing warn-no-linker-script-specified

-include ../makefile.targets
