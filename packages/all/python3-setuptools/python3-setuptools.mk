################################################################################
#
# python3-setuptools
#
################################################################################

PYTHON3_SETUPTOOLS_VERSION = 44.0.0
PYTHON3_SETUPTOOLS_SOURCE = setuptools-$(PYTHON3_SETUPTOOLS_VERSION).zip
PYTHON3_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/b0/f3/44da7482ac6da3f36f68e253cb04de37365b3dba9036a3c70773b778b485
PYTHON3_SETUPTOOLS_LICENSE = MIT
PYTHON3_SETUPTOOLS_LICENSE_FILES = LICENSE
PYTHON3_SETUPTOOLS_SETUP_TYPE = setuptools
PYTHON3_SETUPTOOLS_DL_SUBDIR = python-setuptools
PYTHON3_SETUPTOOLS_NEEDS_PYTHON = python3

define PYTHON3_SETUPTOOLS_EXTRACT_CMDS
	$(UNZIP) -d $(BUILD_DIR) $(PYTHON3_SETUPTOOLS_DL_DIR)/$(PYTHON3_SETUPTOOLS_SOURCE)
	mv $(BUILD_DIR)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)/* $(BUILD_DIR)
	$(RM) -r $(BUILD_DIR)/setuptools-$(PYTHON3_SETUPTOOLS_VERSION)
endef

$(eval $(python-package))
