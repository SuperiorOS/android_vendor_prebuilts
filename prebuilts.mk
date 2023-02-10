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

# Google Photos Pixel Exclusive XML
PRODUCT_COPY_FILES += \
    vendor/prebuilts/etc/sysconfig/pixel_2016_exclusive.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_2016_exclusive.xml \
    vendor/prebuilts/etc/sysconfig/pixel_experience_2020.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/pixel_experience_2020.xml

# Prebuilt packages
PRODUCT_PACKAGES += \
    Flipendo \
    Superiorwalls

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
