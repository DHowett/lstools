TOOL_NAME = lsregister
lsregister_OBJC_FILES = lsregister.m
lsregister_FRAMEWORKS = MobileCoreServices
SDKVERSION = 3.2
GO_EASY_ON_ME = 1

include framework/makefiles/common.mk
include framework/makefiles/tool.mk

internal-package::
	$(FAKEROOT) chown -R 0:80 $(FW_PACKAGE_STAGING_DIR)
