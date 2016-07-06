#
# Copyright (C) 2016 sndnvaps<sndnvaps@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := device/htc/a51dtul/kernel

ifeq ($(TARGET_USE_PREBUILT_KERNEL), true)

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
TARGET_PREBUILT_DT_IMAGE := $(LOCAL_PATH)/dt.img

$(shell rm -rf $(OUT)/obj/KERNEL_OBJ; \
	mkdir -p $(OUT)/obj/KERNEL_OBJ; \
	ln -s $(ANDROID_BUILD_TOP)/$(LOCAL_PATH)/include/usr $(OUT)/obj/KERNEL_OBJ/usr)

# copy the prebuilt kernel and dt.img
$(shell cp $(TARGET_PREBUILT_KERNEL) $(OUT)/kernel)
$(shell cp $(TARGET_PREBUILT_DT_IMAGE) $(OUT)/dt.img)

# hack for twrp
TARGET_CUSTOM_KERNEL_HEADERS := $(OUT)/obj/KERNEL_OBJ/usr/include

endif

