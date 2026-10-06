#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit from device
$(call inherit-product, device/lenovo/x505x_mainline/device.mk)

PRODUCT_NAME := aosp_x505x_mainline
PRODUCT_DEVICE := x505x_mainline
PRODUCT_BRAND := Lenovo
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_MODEL := Lenovo Tab M10 HD
