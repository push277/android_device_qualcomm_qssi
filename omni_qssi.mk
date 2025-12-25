#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# 继承基础配置
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# 继承TWRP通用配置
$(call inherit-product, vendor/omni/config/common.mk)

# 继承设备特定配置
$(call inherit-product, device/qualcomm/qssi/device.mk)

# 产品配置
PRODUCT_NAME := omni_qssi
PRODUCT_DEVICE := qssi
PRODUCT_BRAND := qti
PRODUCT_MODEL := qssi system image for arm64
PRODUCT_MANUFACTURER := qualcomm

PRODUCT_GMS_CLIENTID_BASE := android-qualcomm

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="qssi-user 11 RKQ1.201217.002 1716954220938 release-keys"

BUILD_FINGERPRINT :=qti/qssi/qssi:11/RKQ1.201217.002/1716954220938:user/release-keys