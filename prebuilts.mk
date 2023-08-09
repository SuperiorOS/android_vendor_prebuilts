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
endif

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/bin/backuptool_ab.sh \
    system/bin/backuptool_ab.functions \
    system/bin/backuptool_postinstall.sh

# init file
PRODUCT_COPY_FILES += \
    vendor/prebuilts/common/etc/init/superior-system.rc:$(TARGET_COPY_OUT_PRODUCT)/etc/init/superior-system.rc \
    vendor/prebuilts/common/etc/init/superior-updates.rc:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/init/superior-updates.rc \
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

# Prebuilt packages
PRODUCT_PACKAGES += \
    Flipendo

# QuickPic
ifeq ($(USE_QUICKPIC),true)
PRODUCT_PACKAGES += \
    Quickpic
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
