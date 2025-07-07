# Mecha CometM Gen 3

This board is currently booting via ramdisk image which can be flashed over using,
tftp. 

The `flash.bin` should be generated outside the buildroot environment and kernel
and dtb shall be passed on to the board via any method.

currently it is building the non GUI image, just a console version.

kernel: 6.6.36 from (chiragp-mecha/linux-imx)
uboot: 2023.04 from (chiragp-mecha/u-boot)

defconfigs:
mecha_cometm_defconfig -> minimal ramfs based defconfig
mecha_cometm_gui_defconfig -> GUI ramfs based recovery image defconfig
