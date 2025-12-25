#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/qualcomm/qssi

$(call inherit-product, vendor/twrp/config/common.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

PRODUCT_DEVICE := qssi
PRODUCT_NAME := omni_qssi
PRODUCT_BRAND := qti
PRODUCT_MODEL := qssi system image for arm64
PRODUCT_MANUFACTURER := qualcomm

PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_USE_DYNAMIC_PARTITIONS := true
PRODUCT_RETROFIT_DYNAMIC_PARTITIONS := true
PRODUCT_BUILD_SUPER_PARTITION := true
PRODUCT_SHIPPING_API_LEVEL := 30  # Android 11
PRODUCT_TARGET_VNDK_VERSION := 30
PRODUCT_EXTRA_VNDK_VERSIONS := 29 30

PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.vndk.version=30

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/bin/qseecomd:vendor/bin/qseecomd \
    $(LOCAL_PATH)/vendor/bin/hw/android.hardware.gatekeeper@1.0-service-qti:vendor/bin/hw/android.hardware.gatekeeper@1.0-service-qti \
    $(LOCAL_PATH)/vendor/bin/hw/android.hardware.keymaster@4.0-service-qti:vendor/bin/hw/android.hardware.keymaster@4.0-service-qti

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/lib64/egl/libGLESv1_CM_adreno.so:vendor/lib64/egl/libGLESv1_CM_adreno.so \
    $(LOCAL_PATH)/vendor/lib64/egl/libGLESv2_adreno.so:vendor/lib64/egl/libGLESv2_adreno.so \
    $(LOCAL_PATH)/vendor/lib64/hw/gralloc.bengal.so:vendor/lib64/hw/gralloc.bengal.so \
    $(LOCAL_PATH)/vendor/lib64/hw/hwcomposer.bengal.so:vendor/lib64/hw/hwcomposer.bengal.so

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl-qti.so:vendor/lib64/hw/android.hardware.gatekeeper@1.0-impl-qti.so \
    $(LOCAL_PATH)/vendor/lib64/hw/android.hardware.keymaster@4.0-impl-qti.so:vendor/lib64/hw/android.hardware.keymaster@4.0-impl-qti.so \
    $(LOCAL_PATH)/vendor/lib64/libkeymaster4support.so:vendor/lib64/libkeymaster4support.so

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/lib64/libdrm.so:vendor/lib64/libdrm.so \
    $(LOCAL_PATH)/vendor/lib64/libdrmfs.so:vendor/lib64/libdrmfs.so \
    $(LOCAL_PATH)/vendor/lib64/libdrmtime.so:vendor/lib64/libdrmtime.so \
    $(LOCAL_PATH)/vendor/lib64/libion.so:vendor/lib64/libion.so \
    $(LOCAL_PATH)/vendor/lib64/libion_alloc.so:vendor/lib64/libion_alloc.so \
    $(LOCAL_PATH)/vendor/lib64/liblog.so:vendor/lib64/liblog.so \
    $(LOCAL_PATH)/vendor/lib64/libqmi_client_helper.so:vendor/lib64/libqmi_client_helper.so \
    $(LOCAL_PATH)/vendor/lib64/libqmi_encdec.so:vendor/lib64/libqmi_encdec.so \
    $(LOCAL_PATH)/vendor/lib64/libQSEEComAPI.so:vendor/lib64/libQSEEComAPI.so \
    $(LOCAL_PATH)/vendor/lib64/libxml2.so:vendor/lib64/libxml2.so

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/vendor/etc/init/android.hardware.gatekeeper@1.0-service-qti.rc:vendor/etc/init/android.hardware.gatekeeper@1.0-service-qti.rc \
    $(LOCAL_PATH)/vendor/etc/init/android.hardware.keymaster@4.0-service-qti.rc:vendor/etc/init/android.hardware.keymaster@4.0-service-qti.rc \
    $(LOCAL_PATH)/vendor/etc/vintf/manifest.xml:vendor/etc/vintf/manifest.xml \
    $(LOCAL_PATH)/vendor/etc/permissions/android.hardware.opengles.aep.xml:vendor/etc/permissions/android.hardware.opengles.aep.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/system.prop:system.prop \
    $(LOCAL_PATH)/ueventd.rc:root/ueventd.rc

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_DEVICE=qssi \
    PRODUCT_NAME=omni_qssi

PRODUCT_CHARACTERISTICS := default