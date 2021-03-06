#
# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# msm8939 board, msm8916 kernel

COMMON_PATH := device/htc/msm8939-common

TARGET_SPECIFIC_HEADER_PATH := $(COMMON_PATH)/include

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_CORTEX_A53 := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true
TARGET_BOARD_PLATFORM := msm8916
TARGET_BOARD_PLATFORM_GPU := qcom-adreno405

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := msm8939
TARGET_NO_BOOTLOADER := true

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"
#BOARD_ANT_WIRELESS_DEVICE := "qualcomm-smd"

# Audio
BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_DEEP_BUFFER_RINGTONE := true
AUDIO_FEATURE_ENABLED_ACDB_LICENSE := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_FLAC_OFFLOAD := true
AUDIO_FEATURE_ENABLED_FM := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_INCALL_MUSIC := true
AUDIO_FEATURE_ENABLED_KPI_OPTIMIZE := true
AUDIO_FEATURE_ENABLED_MULTIPLE_TUNNEL := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
AUDIO_FEATURE_LOW_LATENCY_PRIMARY := true
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true
#
# BOARD_SUPPORTS_SOUND_TRIGGER := true # broken
# AUDIO_FEATURE_ENABLED_SPKR_PROTECTION := true # broken
# AUDIO_FEATURE_ENABLED_SSR := true # broken
#

# Camera
BOARD_NUMBER_OF_CAMERAS := 4

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    persist.camera.maxopen=4

# Camera
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_ext
USE_DEVICE_SPECIFIC_CAMERA := true
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND='{"htc.camera.sensor.", AID_CAMERA, 0}, {"camera.4k2k.", AID_MEDIA, 0},'

# CPU
TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true
ARCH_ARM_HAVE_TLS_REGISTER := true

# Crypto
TARGET_HW_DISK_ENCRYPTION := true

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER := libRSDriver_adreno.so
TARGET_CONTINUOUS_SPLASH_ENABLED := true
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
TARGET_USES_OVERLAY := true
BOARD_EGL_CFG := $(COMMON_PATH)/configs/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true

BOARD_HARDWARE_CLASS := \
    $(COMMON_PATH)/cmhw

# Dexopt
ifeq ($(HOST_OS),linux)
  ifeq ($(WITH_DEXPREOPT),)
    WITH_DEXPREOPT := true
  endif
endif

# Fonts
EXTENDED_FONT_FOOTPRINT := true

# Init
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Libc extensions
BOARD_PROVIDES_ADDITIONAL_BIONIC_STATIC_LIBS += libc_htc_symbols

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Malloc
MALLOC_IMPL := dlmalloc

# NFC
# BOARD_NFC_CHIPSET := pn547

# Offmode Charging
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/htc_lpm/lpm_mode
COMMON_GLOBAL_CFLAGS += \
    -DBOARD_CHARGING_CMDLINE_NAME='"androidboot.mode"' \
    -DBOARD_CHARGING_CMDLINE_VALUE='"chargerlogo"'

# Partitions
BOARD_FLASH_BLOCK_SIZE             := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE     := 33554432    # 0x002000000
BOARD_CACHEIMAGE_PARTITION_SIZE    := 268435456   # 0x010000000
BOARD_PERSISTIMAGE_PARTITION_SIZE  := 262144      # 0x000040000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 33554432    # 0x002000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 4294967296  # 0x100000000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10334748672 # 0x268000000 ~ 10334765056 - 16384

# Power
CM_POWERHAL_EXTENSION := qcom
TARGET_POWERHAL_VARIANT := qcom

# Properties
TARGET_SYSTEM_PROP += \
    $(COMMON_PATH)/ril.prop \
    $(COMMON_PATH)/extra.prop

# Qualcomm support
BOARD_USES_QC_TIME_SERVICES := true
BOARD_USES_QCOM_HARDWARE := true

# RIL
# BOARD_PROVIDES_LIBRIL := true
# SIM_COUNT := 2
# TARGET_RIL_VARIANT := caf

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
    $(COMMON_PATH)/sepolicy

BOARD_SEPOLICY_UNION += \
    bluetooth_loader.te \
    device.te \
    file.te \
    file_contexts \
    healthd.te \
    property_contexts \
    qseecomd.te \
    surfaceflinger.te \
    system.te \
    system_app.te \
    system_server.te \
    wcnss_service.te

# TWRP Rec
#RECOVERY_VARIANT=twrp
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
TW_THEME := portrait_hdpi
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_CRYPTO := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_EXCLUDE_ENCRYPTED_BACKUPS := true
TW_INCLUDE_L_CRYPTO := true
TW_INPUT_BLACKLIST := "accelerometer"
TW_NEW_ION_HEAP := true
BOARD_SUPPRESS_SECURE_ERASE := true

# Recovery
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_USES_MMCUTILS := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/rootdir/etc/fstab.qcom
#TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_DENSITY := xhdpi
TARGET_USERIMAGES_USE_EXT4 := true
#TARGET_USERIMAGES_USE_F2FS := true

# Video
TARGET_HAVE_SIGNED_VENUS_FW := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Wifi
BOARD_HAS_QCOM_WLAN := true
BOARD_HAS_QCOM_WLAN_SDK := true
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_qcwcn
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_qcwcn
WIFI_DRIVER_MODULE_NAME := "wlan"
WIFI_DRIVER_MODULE_PATH := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_FW_PATH_AP := "ap"
WIFI_DRIVER_FW_PATH_STA := "sta"
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Inherit from the proprietary version
-include vendor/htc/msm8939-common/BoardConfigVendor.mk
