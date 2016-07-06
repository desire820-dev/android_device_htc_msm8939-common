# Release name
PRODUCT_RELEASE_NAME := a51dtul

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/htc/a51dtul/full_a51dtul.mk)

BOARD_VENDOR := htc
BOARD_NUMBER_OF_CAMERAS := 4

# Device naming
PRODUCT_NAME := cm_a51dtul
PRODUCT_DEVICE := a51dtul
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := HTC
