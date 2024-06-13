TARGET := iphone:clang:14.5:14.0
ARCHS = arm64
THEOS_PACKAGE_SCHEME=rootless
INSTALL_TARGET_PROCESSES = itunesstored
GO_EASY_ON_ME = 1
export THEOS_DEVICE_IP = localhost
export THEOS_DEVICE_PORT = 2223
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = KbsyncTweak

KbsyncTweak_FILES = Tweak.m
KbsyncTweak_CFLAGS += -fobjc-arc
KbsyncTweak_CFLAGS += -Wno-unused-variable
# KbsyncTweak_CFLAGS += -DROCKETBOOTSTRAP_LOAD_DYNAMIC=1 -D__COREFOUNDATION_CFMESSAGEPORT__=1
KbsyncTweak_CFLAGS += -Wno-implicit-function-declaration

KbsyncTweak_LIBRARIES = rocketbootstrap
KbsyncTweak_FRAMEWORKS = CoreFoundation
KbsyncTweak_PRIVATE_FRAMEWORKS = Accounts AppSupport StoreServices
include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS = kbsynctool
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 AppStore; killall -9 itunesstored; killall -9 appstored 2>/dev/null &"
