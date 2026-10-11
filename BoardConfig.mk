#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

BUILD_BROKEN_MISSING_REQUIRED_MODULES := true
BUILD_BROKEN_DUP_RULES := true

USES_DEVICE_LENOVO_X505X := true

# Inherit from mainline/qcom-common
include device/mainline/qcom-common/BoardConfigMainlineQcomCommon.mk

# A/B
AB_OTA_UPDATER := false

# Bootloader
BOARD_BOOT_HEADER_VERSION := 2
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(DEVICE_PATH)/mkbootimg.mk
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_LK2ND_MAKE_FLAGS := \
    LK2ND_ADTBS=sdm429-lenovo-tbx505x.dtb \
    LK2ND_COMPATIBLE=lenovo,tbx505x \
    OSVERSION_IN_BOOTIMAGE=1

# Boot parameters
BOARD_KERNEL_CMDLINE := \
    $(MAINLINE_COMMON_KERNEL_PARAMS) \
    $(MAINLINE_QCOM_KERNEL_PARAMS) \
    $(MAINLINE_QCOM_SOC_ANDROIDBOOT_PARAMS) \
    $(MAINLINE_QCOM_SOC_KERNEL_PARAMS) \
    androidboot.hardware=x505x \
    androidboot.verifiedbootstate=orange \
    console=tty0

ifneq ($(TARGET_LK2ND_PLATFORM),)
BOARD_KERNEL_CMDLINE += \
    lk2nd.pass-ramoops=zap
endif

# TODO: Remove when permissive is no longer needed
BOARD_KERNEL_CMDLINE += \
    androidboot.selinux=permissive \
    audit=0

# Display
TARGET_SCREEN_DENSITY := 160

# Filesystem
TARGET_USERIMAGES_USE_F2FS := true
TARGET_USERIMAGES_USE_EXT4 := true

# Kernel
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
TARGET_KERNEL_CONFIG := sdm429-lenovo-tbx505x_defconfig
TARGET_KERNEL_SOURCE := kernel/mainline/msm89x7-mainline

TARGET_DTB_LIST_WILDCARD := \
    qcom/sdm429-lenovo-tbx505x

# Kernel modules
BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD := \
    $(strip $(shell cat $(DEVICE_PATH)/modprobe/modules.load.basic)) \
    $(strip $(shell cat $(DEVICE_PATH)/modprobe/modules.load.drm)) \
    $(strip $(shell cat $(DEVICE_PATH)/modprobe/modules.load.touchscreen))
BOARD_VENDOR_KERNEL_MODULES_LOAD := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)
RECOVERY_KERNEL_MODULES := \
    $(BOARD_RECOVERY_RAMDISK_KERNEL_MODULES_LOAD)

TARGET_AUTO_COLLECT_KERNEL_MODULE_DEPS := true

# OTA
TARGET_OTA_ASSERT_DEVICE := x505x,x505,TB-X505X,x505x_mainline

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := -1
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3221225472
BOARD_VENDORIMAGE_EXTFS_INODE_COUNT := -1
BOARD_VENDORIMAGE_PARTITION_SIZE := 536870912
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4

BOARD_USES_METADATA_PARTITION := true
TARGET_COPY_OUT_VENDOR := vendor

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/properties/odm.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/properties/vendor.prop

# Ramdisk
BOARD_RAMDISK_USE_LZ4 := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/fstab/fstab.x505x

# SELinux
BOARD_ODM_SEPOLICY_DIRS += \
    $(DEVICE_PATH)/sepolicy/odm
