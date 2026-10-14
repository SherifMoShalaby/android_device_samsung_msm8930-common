ifeq ($(TARGET_PROVIDES_CAMERA_HAL),true)

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(TARGET_NEED_DISABLE_AUTOFOCUS),true)
    LOCAL_CFLAGS += -DDISABLE_AUTOFOCUS
endif

ifeq ($(TARGET_NEED_DISABLE_FACE_DETECTION),true)
    LOCAL_CFLAGS += -DDISABLE_FACE_DETECTION
endif

ifeq ($(TARGET_NEED_DISABLE_FACE_DETECTION_BOTH_CAMERAS),true)
    LOCAL_CFLAGS += -DDISABLE_FACE_DETECTION_BOTH_CAMERAS
endif

ifeq ($(TARGET_NEED_CAMERA_ZSL),true)
    LOCAL_CFLAGS += -DENABLE_ZSL
endif

ifeq ($(TARGET_NEED_FFC_PICTURE_FIXUP),true)
    LOCAL_CFLAGS += -DFFC_PICTURE_FIXUP
endif

ifeq ($(TARGET_NEED_FFC_VIDEO_FIXUP),true)
    LOCAL_CFLAGS += -DFFC_VIDEO_FIXUP
endif

ifeq ($(TARGET_NEED_SAMSUNG_CAMERA_MODE),true)
    LOCAL_CFLAGS += -DSAMSUNG_CAMERA_MODE
endif

ifeq ($(TARGET_ADD_ISO_MODE_50),true)
    LOCAL_CFLAGS += -DISO_MODE_50
endif

ifeq ($(TARGET_ADD_ISO_MODE_1600),true)
    LOCAL_CFLAGS += -DISO_MODE_1600
endif

ifeq ($(TARGET_ADD_ISO_MODE_HJR),true)
    LOCAL_CFLAGS += -DISO_MODE_HJR
endif

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../include \
    framework/native/include \
    system/media/camera/include

LOCAL_SRC_FILES := \
    CameraWrapper.cpp

LOCAL_SHARED_LIBRARIES := \
    libhardware \
    liblog \
    libutils \
    android.hidl.token@1.0-utils

LOCAL_STATIC_LIBRARIES := \
    libarect \
    camera_parameters_samsung_msm8930

LOCAL_MODULE := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
# Vendor module: the vendor camera provider only searches vendor paths. CameraParameters
# comes from the device's own static copy instead of libcamera_client (platform-only on 14).
LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)

endif
