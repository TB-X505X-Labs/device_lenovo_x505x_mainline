#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_DEVICE_PATH := device/xiaomi/mi89xx-mainline/tiare_mainline

# Inherit from parent
$(call inherit-product, device/xiaomi/mi89xx-mainline/device.mk)

# AAPT
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
TARGET_AUDIO_MAINLINE_UCM_PROFILES := xiaomi-tiare

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# Dynamic Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Go
PRODUCT_GO_DEFAULTS_SUFFIX := _512

# Init
PRODUCT_PACKAGES += \
    fstab.tiare \
    fstab.tiare.ramdisk \
    init.tiare.rc \
    init.recovery.tiare.rc \
    ueventd.tiare.rc

PRODUCT_PACKAGES += \
    use_memfd.rc

# Input
PRODUCT_PACKAGES += \
    Goodix_Capacitive_TouchScreen.kl \
    ts_vkeys.kl

TARGET_TOUCHSCREEN_HAS_VIRTUAL_KEYS := true

# Kernel
PRODUCT_PACKAGES += \
    modules.load.normal

PRODUCT_PACKAGES += \
    AodDefaultOnOverlay

# SoC
TARGET_QCOM_SOC := msm8917

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(TARGET_DEVICE_PATH) \
    kernel/mainline/configs
