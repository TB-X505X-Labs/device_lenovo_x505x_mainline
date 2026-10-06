#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/lenovo/x505x_mainline

# Inherit from mainline/qcom-common
$(call inherit-product, device/mainline/qcom-common/mainline_qcom-common.mk)

# AAPT
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Audio
## TODO: Bringup the audio hardware and switch to the mainline audio HAL
TARGET_AUDIO_HAL := default-aidl

# Bootanimation
TARGET_BOOTANIMATION_HALF_RES := true
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.camera.front.xml

# Disable
## TODO: Bringup the corresponding hardware and remove the following definitions
TARGET_LIGHT_HAL := none
TARGET_SUPPORTS_SUSPEND := false

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.memory.block@1.0.vendor

# Init
PRODUCT_PACKAGES += \
    init.x505x.rc \
    ueventd.x505x.rc

PRODUCT_PACKAGES += \
    use_memfd.rc \
    zram.rc

$(call soong_config_set,mainline_common_libinit,set_properties_from,devicetree)

# Kernel
PRODUCT_OTA_ENFORCE_VINTF_KERNEL_REQUIREMENTS := false

PRODUCT_PACKAGES += \
    modules.load.normal

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(DEVICE_PATH)/overlays/overlay

PRODUCT_PACKAGES += \
    AodDefaultOnOverlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Scoped Storage
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensor.accelerometer.prebuilt.xml

# Shipping API level
TARGET_FOLLOWS_LATEST_SHIPPING_API_LEVEL := true

# SoC
TARGET_QCOM_SOC := sdm429

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH) \
    kernel/mainline/configs

# VINTF
TARGET_FOLLOWS_LATEST_VINTF_TARGET_LEVEL := true
