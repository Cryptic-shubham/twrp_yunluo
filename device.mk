#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/xiaomi/yunluo

# Virtual A/B
ENABLE_VIRTUAL_AB := true
PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := gz
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
	RUN_POSTINSTALL_system=true \
	POSTINSTALL_PATH_system=system/bin/otapreopt_script \
	FILESYSTEM_TYPE_system=$(BOARD_SYSTEMIMAGE_PARTITION_TYPE) \
	POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=$(BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE) \
    POSTINSTALL_OPTIONAL_vendor=true

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Screen
TARGET_SCREEN_HEIGHT := 2000
TARGET_SCREEN_WIDTH := 1200

# Allow userspace reboots
$(call inherit-product, $(SRC_TARGET_DIR)/product/userspace_reboot.mk)

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 31

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot-service.default \
    android.hardware.boot-service.default_recovery


PRODUCT_PACKAGES += \
    bootctrl.mt6789

PRODUCT_PACKAGES_DEBUG += \
    bootctrl

# Shipping API Level
PRODUCT_SHIPPING_API_LEVEL := 31

# PRODUCT_STATIC_BOOT_CONTROL_HAL := \
#    bootctrl.mt6789 \
#    libgptutils \
#    libz \
#    libcutils

# MTK PlPath Utils
PRODUCT_PACKAGES += \
    mtk_plpath_utils.recovery

PRODUCT_PACKAGES += \
    otapreopt_script \
    cppreopts.sh \
    update_engine \
    update_verifier \
    update_engine_sideload \
    checkpoint_gc

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libion \
    libpuresoftkeymasterdevice

# fastbootd
PRODUCT_PACKAGES += \
    fastbootd \
    android.hardware.fastboot@1.1-impl-mock 
    
# Gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl:64 \
    android.hardware.gatekeeper@1.0-service

# Keymaster / Keymint
PRODUCT_PACKAGES += \
	libkeymaster_messages.vendor:64 \
	libkeymaster_portable.vendor:64 \
	libkeymint.vendor:64 \
	libpuresoftkeymasterdevice.vendor:64

# Init files
PRODUCT_PACKAGES += \
        init.recovery.microtrust.rc \
	init.recovery.mt6789.rc \
	init.recovery.mt8781.rc \
	ueventd.mt6789.rc \
	fstab.mt6789 \
	fstab.mt8781 \
	init.recovery.usb.rc 
        
# Health Hal
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service





