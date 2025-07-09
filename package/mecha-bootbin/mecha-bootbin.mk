################################################################################
#
# mecha-bootbin
#
################################################################################

MECHA_BOOTBIN_VERSION = lf-6.1.1_1.0.0
MECHA_BOOTBIN_SITE = https://github.com/mecha-org/imx-mkimage
MECHA_BOOTBIN_SITE_METHOD = git
MECHA_BOOTBIN_LICENSE = GPL-2.0+
MECHA_BOOTBIN_LICENSE_FILES = LICENSE
MECHA_BOOTBIN_DEPENDENCIES = host-zlib uboot arm-trusted-firmware firmware-imx

MECHA_BOOTBIN_INSTALL_IMAGES = YES
MECHA_BOOTBIN_INSTALL_TARGET = NO

ARTEFACTS := ${BINARIES_DIR}
UBOOT_BUILD_DIR := $(shell find $(BUILD_DIR) -maxdepth 1 -type d -name "uboot*" | head -1)

define MECHA_BOOTBIN_BUILD_CMDS
	cp $(ARTEFACTS)/u-boot-spl.bin $(@D)/iMX8M/
	cp $(ARTEFACTS)/u-boot-nodtb.bin $(@D)/iMX8M/
	cp $(ARTEFACTS)/bl31.bin $(@D)/iMX8M/
	cp $(ARTEFACTS)/lpddr4_pmu_train_* $(@D)/iMX8M/
	cp $(UBOOT_BUILD_DIR)/arch/arm/dts/mecha-comet.dtb $(@D)/iMX8M/
	cp $(UBOOT_BUILD_DIR)/tools/mkimage $(@D)/iMX8M/mkimage_uboot

	echo '#define MKIMAGE_COMMIT 0x941fc65' > $(@D)/src/build_info.h

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) SOC=iMX8MM PLAT=mecha-comet flash_evk

endef

define MECHA_BOOTBIN_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0644 $(@D)/iMX8M/flash.bin $(BINARIES_DIR)/flash.bin
endef

$(eval $(generic-package))
