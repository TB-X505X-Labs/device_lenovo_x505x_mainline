#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    aosp_x505x_mainline:$(LOCAL_DIR)/aosp_x505x_mainline.mk \
    lineage_x505x_mainline:$(LOCAL_DIR)/lineage_x505x_mainline.mk

$(foreach build_type, user userdebug eng, \
    $(eval COMMON_LUNCH_CHOICES += aosp_x505x_mainline-$(build_type)) \
    $(eval COMMON_LUNCH_CHOICES += lineage_x505x_mainline-$(build_type)))
