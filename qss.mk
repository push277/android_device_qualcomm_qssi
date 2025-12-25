#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# 继承 omni_qssi 配置
$(call inherit-product, device/qualcomm/qssi/omni_qssi.mk)

# 覆盖产品名称为 qssi（与设备名相同）
PRODUCT_NAME := qssi