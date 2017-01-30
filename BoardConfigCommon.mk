#
# Copyright (C) 2014 The CyanogenMod Project
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

# Inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/lentislte-common

# Architecture
TARGET_CPU_VARIANT := krait

ENABLE_CPUSETS := true

# L1/L2 cache size parameters by @JustArchi
BOARD_GLOBAL_CFLAGS := --param l1-cache-size=32 --param l1-cache-line-size=16 --param l2-cache-size=2048

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
AUDIO_FEATURE_ENABLED_HWDEP_CAL := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_ENABLED_NEW_SAMPLE_RATE := true
AUDIO_FEATURE_ENABLED_ANC_HEADSET := true
BOARD_USES_ES705 := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Camera
TARGET_USE_COMPAT_GRALLOC_ALIGN := true
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_GLOBAL_CFLAGS += -DSAMSUNG_CAMERA_HARDWARE

# Charger
BOARD_BATTERY_DEVICE_NAME := "battery"
BOARD_CHARGING_CMDLINE_NAME := "androidboot.bootchg"
BOARD_CHARGING_CMDLINE_VALUE := "true"

# MKHW
BOARD_HARDWARE_CLASS += hardware/samsung/mkhw
BOARD_HARDWARE_CLASS += device/samsung/lentislte-common/mkhw   

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
HAVE_ADRENO_SOURCE := false
USE_OPENGL_RENDERER := true
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
NUM_FRAMEBUFFER_SURFACE_BUFFERS :=3
TARGET_USES_OVERLAY := true

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# GPS
TARGET_NO_RPC := true
USE_DEVICE_SPECIFIC_GPS := true

BLOCK_BASED_OTA := true

# Include path
TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 dwc3_msm.cpu_to_affin=1 androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SEPARATED_DT := true
BOARD_RAMDISK_OFFSET     := 0x02600000
BOARD_KERNEL_TAGS_OFFSET := 0x02400000
BOARD_SECOND_OFFSET      := 0x00f00000
TARGET_KERNEL_ARCH := arm
TARGET_KERNEL_VARIANT_CONFIG  := dummy_defconfig
KERNEL_TOOLCHAIN := $(ANDROID_BUILD_TOP)/prebuilts/gcc/$(HOST_OS)-x86/arm/arm-eabi-4.8/bin
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-eabi-

TARGET_KERNEL_SOURCE := kernel/samsung/lentislte

#Keymaster
TARGET_KEYMASTER_WAIT_FOR_QSEE := true

# Display
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
VSYNC_EVENT_PHASE_OFFSET_NS := 7500000

# Legacy BLOB Support
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# NFC
BOARD_NFC_CHIPSET := pn547

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 17825792
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 21793600
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2247483648
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26558312448

# Platform
TARGET_BOARD_PLATFORM := apq8084
TARGET_BOARD_PLATFORM_GPU := qcom-adreno420

# Power HAL
TARGET_POWERHAL_VARIANT := qcom
#CM_POWERHAL_EXTENSION := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT := $(LOCAL_PATH)/power/power_ext.c

# Data services
USE_DEVICE_SPECIFIC_DATASERVICES := true

# Qualcomm support
TARGET_GLOBAL_CFLAGS += -DQCOM_BSP
TARGET_USES_QCOM_BSP := true

# Radio
BOARD_RIL_CLASS := ../../../device/samsung/lentislte-common/ril

# Recovery
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/etc/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    device/samsung/lentislte-common/sepolicy

# Init
TARGET_INIT_VENDOR_LIB := libinit_apq8084
TARGET_RECOVERY_DEVICE_MODULES := libinit_apq8084

# Time
BOARD_USES_QC_TIME_SERVICES := true

# Sensors
TARGET_NO_SENSOR_PERMISSION_CHECK := true

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WPA_SUPPLICANT_VERSION := VER_0_8_X

