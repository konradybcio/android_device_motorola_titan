#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# call the proprietary setup
$(call inherit-product-if-exists, vendor/motorola/titan/titan-vendor.mk)

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Audio configuration
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/mixer_paths.xml:system/etc/mixer_paths_auxpcm.xml

# Ramdisk
PRODUCT_PACKAGES += \
    fstab.qcom \
    init.target.rc

# Wifi
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin

# Ubuntu Overlay Files
PRODUCT_COPY_FILES += \
    device/motorola/titan/ubuntu/adbd.conf:system/ubuntu/etc/init/adbd.conf \
    device/motorola/titan/ubuntu/bluetooth-touch-titan.conf:system/ubuntu/etc/init/bluetooth-touch-titan.conf \
    device/motorola/titan/ubuntu/titan.conf:system/ubuntu/etc/ubuntu-touch-session.d/titan.conf \
    device/motorola/titan/ubuntu/set-brightness-titan.conf:system/ubuntu/etc/set-brightness-titan.conf \
    device/motorola/titan/ubuntu/ubuntu-location-service.conf:system/ubuntu/etc/ubuntu-location-service.conf \
    device/motorola/titan/ubuntu/70-titan.rules:system/ubuntu/usr/lib/lxc-android-config/70-titan.rules \
    device/motorola/titan/ubuntu/config.xml:system/ubuntu/usr/share/repowerd/device-configs/config-titan.xml \
    device/motorola/titan/ubuntu/ofono.override:system/ubuntu/etc/init/ofono.override

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1

# Enable strict operation
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.strict_op_enable=false \
    persist.sys.usb.config=mtp,adb

# Inherit from msm8226-common
$(call inherit-product, device/motorola/msm8226-common/msm8226.mk)
$(call inherit-product-if-exists, hardware/display-caf/msm8974/Android.mk)
