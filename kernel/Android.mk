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
LOCAL_MODULES_PATH := device/htc/a51dtul/kernel/include/modules
KERNEL_MODULES_OUT := $(TARGET_OUT)/lib/modules

ifeq ($(TARGET_USE_PREBUILT_KERNEL), true)

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
TARGET_PREBUILT_DT_IMAGE := $(LOCAL_PATH)/dt.img

$(shell rm -rf $(OUT)/obj/KERNEL_OBJ; \
	mkdir -p $(OUT)/obj/KERNEL_OBJ; \
	ln -s $(ANDROID_BUILD_TOP)/$(LOCAL_PATH)/include/usr $(OUT)/obj/KERNEL_OBJ/usr)

# copy the prebuilt kernel and dt.img
$(shell cp $(TARGET_PREBUILT_KERNEL) $(OUT)/kernel)
$(shell cp $(TARGET_PREBUILT_DT_IMAGE) $(OUT)/dt.img)


# Create a link for the wlan modules
$(shell mkdir -p $(TARGET_OUT)/lib/modules/pronto; \
        ln -sf /system/lib/modules/pronto/pronto_wlan.ko \
               $(TARGET_OUT)/lib/modules/wlan.ko)

# copy  wlan and fmradio modules
$(shell cp $(LOCAL_MODULES_PATH)/radio-iris-transport.ko $(KERNEL_MODULES_OUT)/radio-iris-transport.ko)
$(shell cp $(LOCAL_MODULES_PATH)/texfat.ko $(KERNEL_MODULES_OUT)/texfat.ko)
$(shell cp $(LOCAL_MODULES_PATH)/pronto/pronto_wlan.ko $(KERNEL_MODULES_OUT)/pronto/pronto_wlan.ko)

# hack for twrp
TARGET_CUSTOM_KERNEL_HEADERS := $(OUT)/obj/KERNEL_OBJ/usr/include

endif

