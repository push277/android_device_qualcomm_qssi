#
# Copyright (C) 2025 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

# 继承基础配置
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# 继承TWRP配置
$(call inherit-product-if-exists, vendor/omni/config/common.mk)
$(call inherit-product-if-exists, vendor/twrp/config/common.mk)

# 设备配置
PRODUCT_DEVICE := qssi
PRODUCT_NAME := qssi
PRODUCT_BRAND := qti
PRODUCT_MODEL := qssi system image for arm64
PRODUCT_MANUFACTURER := qualcomm

# 其他配置
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_EXTRA_VNDK_VERSIONS := 29 30

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.vndk.version=30

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=qssi \
    PRODUCT_NAME=qssi

BUILD_FINGERPRINT := qti/qssi/qssi:11/RKQ1.201217.002/1716954220938:user/release-keys