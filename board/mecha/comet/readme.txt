# Mecha Comet (rev3)

This board is currently booting via ramdisk image which can be flashed over using,
tftp. 

The `flash.bin` should be generated outside the buildroot environment and kernel
and dtb shall be passed on to the board via any method.

Builds both console as well as GUI (weston) image depending on the defconfig selected.

kernel: 6.6.36 from (chiragp-mecha/linux-imx)
uboot: 2023.04 from (chiragp-mecha/u-boot)

defconfigs:
mecha_comet_defconfig => emmc flashing image
mecha_comet_ramfs_defconfig => ramfs flashing image
mecha_comet_gui_defconfig => gui image
mecha_comet_recovery_defconfig => ramfs based recovery image