#
# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


# Inherit from common msm8953-common
-include device/xiaomi/msm8953-common/BoardConfigCommon.mk

DEVICE_PATH := device/xiaomi/mido

# Filesystem
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
TARGET_CPU_VARIANT := cortex-a53

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.bootdevice=7824900.sdhci earlycon=msm_hsl_uart,0x78af000
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE :=  2048
BOARD_MKBOOTIMG_ARGS := --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_CONFIG := mido_defconfig
TARGET_KERNEL_SOURCE := kernel/xiaomi/msm8953

# Lineage Hardware
BOARD_HARDWARE_CLASS += \
    $(DEVICE_PATH)/lineagehw

#AUDIO
TARGET_QCOM_AUDIO_VARIANT := caf-msm8996
TARGET_QCOM_MEDIA_VARIANT := caf-msm8996
USE_CUSTOM_AUDIO_POLICY := 0
USE_XML_AUDIO_POLICY_CONF := 1

#Display
TARGET_QCOM_DISPLAY_VARIANT := caf-msm8996

#Camera
USE_DEVICE_SPECIFIC_CAMERA := true

# Partitions
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_USERDATAIMAGE_PARTITION_SIZE := 25765043200 # 25765059584 - 16384
BOARD_VENDORIMAGE_PARTITION_SIZE := 872415232

# Power
TARGET_TAP_TO_WAKE_NODE := "/proc/touchpanel/enable_dt2w"

# Sepolicy
BOARD_PLAT_PRIVATE_SEPOLICY_DIR += $(DEVICE_PATH)/sepolicy/private
BOARD_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor

# Treble
BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_COMPATIBILITY_MATRIX_LEVEL_OVERRIDE := 27

# Inherit from the proprietary version
-include vendor/xiaomi/mido/BoardConfigVendor.mk
