TARGET := iphone:clang:14.5:14.0
# THEOS_DEVICE_IP = 127.0.0.1
# THEOS_DEVICE_PORT = 58422
ARCHS = arm64
THEOS_PACKAGE_SCHEME=rootless
GO_EASY_ON_ME = 1
include $(THEOS)/makefiles/common.mk

TOOL_NAME = kbsynctool

kbsynctool_FILES = main.m $(wildcard GCDWebServer/*/*.m)
kbsynctool_CFLAGS = -fobjc-arc -IGCDWebServer/Core -IGCDWebServer/Requests -IGCDWebServer/Responses
kbsynctool_CFLAGS += -Wno-implicit-function-declaration
kbsynctool_CFLAGS += -Wno-int-conversion
kbsynctool_LIBRARIES = rocketbootstrap
kbsynctool_PRIVATE_FRAMEWORKS = AppSupport
kbsynctool_CODESIGN_FLAGS = -Sentitlements.plist
kbsynctool_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
