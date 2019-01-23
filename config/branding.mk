# Set all versions
OTA_TYPE ?= UNOFFICIAL
CUSTOM_BUILD_DATE := $(shell date +"%y%m%d")
CUSTOM_PLATFORM_VERSION := 9.0

TARGET_PRODUCT_SHORT := $(subst cosp_,,$(CUSTOM_BUILD))

ifeq ($(IS_GO_VERSION), true)
CUSTOM_VERSION := COSP-$(CUSTOM_BUILD_DATE)-$(OTA_TYPE)-$(CUSTOM_BUILD)
ROM_FINGERPRINT := COSP_go/$(CUSTOM_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)
else
CUSTOM_VERSION := COSP-$(CUSTOM_BUILD_DATE)-$(OTA_TYPE)-$(CUSTOM_BUILD)
ROM_FINGERPRINT := COSP/$(CUSTOM_PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)
endif

VERSION_PROP := COSP-$(CUSTOM_BUILD_DATE)-$(OTA_TYPE)

CUSTOM_PROPERTIES := \
    org.cosp.version=$(VERSION_PROP) \
    org.cosp.build_date=$(CUSTOM_BUILD_DATE) \
    org.cosp.build_type=$(OTA_TYPE) \
    org.cosp.fingerprint=$(ROM_FINGERPRINT) \
    org.cosp.timestamp=$(shell date +%s)
