#
# Copyright (C) 2025 The Android Open Source Project
# Copyright (C) 2025 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/qualcomm/qssi

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a9

# APEX
DEXPREOPT_GENERATE_APEX_IMAGE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bengal
TARGET_NO_BOOTLOADER := true

# Display
TARGET_SCREEN_DENSITY := 480

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 earlycon=msm_geni_serial,0x4a90000 androidboot.hardware=qcom androidboot.console=ttyMSM0 androidboot.memcg=1 lpm_levels.sleep_disabled=1 video=vfb:640x400,bpp=32,memsize=3072000 msm_rtb.filter=0x237 service_locator.enable=1 swiotlb=2048 loop.max_part=7 buildvariant=user androidboot.selinux=permissive
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := qssi_defconfig
TARGET_KERNEL_SOURCE := kernel/qualcomm/qssi

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := 
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296      # Fixed: Actual size from device (96MB)
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296  # Fixed: Actual size from device (96MB)
BOARD_CACHEIMAGE_PARTITION_SIZE := 469762048     # Added: Cache partition size (448MB)
BOARD_METADATAIMAGE_PARTITION_SIZE := 16777216   # Added: Metadata partition size (16MB)
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := ext4   # Added: system_ext partition type
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4      # Added: product partition type
BOARD_ODMIMAGE_FILE_SYSTEM_TYPE := ext4          # Added: odm partition type
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs     # Fixed: Actual filesystem from device
#BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
#TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 8598323200         # Fixed: Actual super partition size (8GB)
BOARD_SUPER_PARTITION_GROUPS := qti_dynamic_partitions  # Fixed: Actual dynamic partition group name
BOARD_SUPER_PARTITION_BLOCK_DEVICES := system vendor product  # Added: Required for dynamic partitions
BOARD_SUPER_PARTITION_METADATA_DEVICE := system  # Added: Required for dynamic partitions
BOARD_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm my_product my_engineering my_company my_carrier my_region my_heytap my_stock my_preload my_manifest  # Fixed: Actual partition list from device
BOARD_QTI_DYNAMIC_PARTITIONS_SIZE := 8594194432  # Fixed: Actual dynamic partitions size (super size - 4MB metadata)

# Platform
TARGET_BOARD_PLATFORM := bengal
TARGET_BOARD_SUFFIX := _64

# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_RECOVERY_QCOM_RTC_FIX := true      # Added: Fix QCOM RTC issues
TARGET_USES_MKE2FS := true               # Added: Use mke2fs for filesystem creation

# Security patch level
VENDOR_SECURITY_PATCH := 2021-08-01

# Hack: prevent anti rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# TWRP Dynamic Partitions Support - Added: Required for dynamic partitions
TW_HAS_DYNAMIC_PARTITIONS := true
TW_SUPER_PARTITION_PATH := /dev/block/by-name/super
TW_SUPER_PARTITION_SIZE := 8598323200
TW_SUPER_PARTITION_GROUPS := qti_dynamic_partitions
TW_QTI_DYNAMIC_PARTITIONS_PARTITION_LIST := system system_ext product vendor odm my_product my_engineering my_company my_carrier my_region my_heytap my_stock my_preload my_manifest
TW_QTI_DYNAMIC_PARTITIONS_SIZE := 8594194432

# TWRP Encryption Support - Added: Required for FBE (File-Based Encryption)
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_FBE_METADATA_DECRYPT := true

# TWRP Filesystem Support - Added: Support for various filesystems
TW_INCLUDE_FUSE_EXFAT := true
TW_INCLUDE_FUSE_NTFS := true
TW_INCLUDE_NTFS_3G := true

# TWRP Tools Support - Added: Various tools for recovery operations
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true

# TWRP Functional Configuration - Added: Various functional settings
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_EXCLUDE_APEX := true
TW_NO_SCREEN_BLANK := true
TW_IGNORE_MISC_WIPE_DATA := true
TW_SKIP_ADDITIONAL_FSTAB := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TARGET_RECOVERY_FSTAB := device/qualcomm/qssi/recovery.fstab


# QCOM Platform Specific - Added: QCOM specific configurations
BOARD_USES_QCOM_HARDWARE := true
TARGET_USES_QCOM_BSP := true
BOARD_USES_QCOM_FBE_DECRYPTION := true
BOARD_USES_METADATA_PARTITION := true

# Brightness Configuration - Added: Brightness control settings
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 2048