# Copyright (C) 2023 The SuperiorOS Project
#
# SPDX-License-Identifier: Apache-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/prebuilts/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/prebuilts/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/prebuilts/common/bin/50-superior.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-superior.sh

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/addon.d/50-superior.sh

ifneq ($(strip $(AB_OTA_PARTITIONS) $(AB_OTA_POSTINSTALL_CONFIG)),)
PRODUCT_COPY_FILES += \
    vendor/prebuilts/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/prebuilts/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/prebuilts/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/backuptool_ab.sh \
    system/bin/backuptool_ab.functions \
    system/bin/backuptool_postinstall.sh

ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif
endif

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/prebuilts/common/etc/sysconfig/preinstalled-packages-platform-superior-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-superior-product.xml

# init file
PRODUCT_COPY_FILES += \
    vendor/prebuilts/common/etc/init/init.superior-system_ext.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.superior-system_ext.rc \
    vendor/prebuilts/common/etc/init/init.superior-updater.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/init.superior-updater.rc \
    vendor/prebuilts/common/etc/init/init.openssh.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/init.openssh.rc

#Audio
include vendor/prebuilts/audio.mk

# Bootanimation
include vendor/prebuilts/common/bootanimation/bootanimation.mk

# Google Photos Pixel Exclusive XML
PRODUCT_COPY_FILES += \
    vendor/prebuilts/etc/sysconfig/google_build.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google_build.xml \
    vendor/prebuilts/etc/sysconfig/nexus.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/nexus.xml \
    vendor/prebuilts/etc/sysconfig/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2016_exclusive.xml \
    vendor/prebuilts/etc/sysconfig/pixel_experience_2017.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2017.xml \
    vendor/prebuilts/etc/sysconfig/pixel_experience_2018.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2018.xml \
    vendor/prebuilts/etc/sysconfig/pixel_experience_2019.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2019.xml \
    vendor/prebuilts/etc/sysconfig/pixel_experience_2019_midyear.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2019_midyear.xml \
    vendor/prebuilts/etc/sysconfig/pixel_experience_2020.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2020.xml \
    vendor/prebuilts/etc/sysconfig/pixel_experience_2020_midyear.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2020_midyear.xml

# DOT Gallery
ifeq ($(USE_DOTGALLERY),true)
PRODUCT_PACKAGES += \
    DotGallery

PRODUCT_COPY_FILES += \
    vendor/prebuilts/permissions/privapp-permissions-dotgallery.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-dotgallery.xml
endif

# MotoCalculator
ifeq ($(USE_MOTO_CALCULATOR),true)
PRODUCT_PACKAGES += \
    MotoCalculator
else
PRODUCT_PACKAGES += \
    ExactCalculator
endif

# DuckDuckGo
ifeq ($(USE_DUCKDUCKGO),true)
PRODUCT_PACKAGES += \
    DuckDuckGo
else
PRODUCT_PACKAGES += \
    ViaBrowser
endif

# Keyboard
ifneq ($(BUILD_WITH_GAPPS),true)
PRODUCT_PACKAGES += \
    Keyboard
endif
