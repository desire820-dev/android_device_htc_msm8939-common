LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_SRC_FILES := \
    sensor_shim.cpp
LOCAL_SHARED_LIBRARIES := libbinder
LOCAL_MODULE := libshim_sensor
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
