DTS_DIR := $(DTS_DIR)/qcom

define Device/8devices_kiwi-dvk
	$(call Device/FitImage)
	$(call Device/EmmcImage)
	DEVICE_VENDOR := 8devices
	DEVICE_MODEL := Kiwi-DVK
	DEVICE_DTS_CONFIG := config@8dev-kiwi
	SOC := ipq9570
	DEVICE_PACKAGES := kmod-ath12k ath12k-firmware-qcn9274 ipq-wifi-8devices_kiwi f2fsck mkf2fs kmod-sfp kmod-phy-maxlinear
	IMAGE/factory.bin := qsdk-ipq-factory-nor
endef
TARGET_DEVICES += 8devices_kiwi-dvk

define Device/qcom_rdp433
	$(call Device/FitImageLzma)
	DEVICE_VENDOR := Qualcomm Technologies, Inc.
	DEVICE_MODEL := RDP433
	DEVICE_VARIANT := AP-AL02-C4
	BOARD_NAME := ap-al02.1-c4
	DEVICE_DTS_CONFIG := config@rdp433
	DEVICE_DTS_DIR := $(DTS_DIR)
	SOC := ipq9574
	KERNEL_INSTALL := 1
	KERNEL_SIZE := 6096k
	IMAGE_SIZE := 25344k
	IMAGE/sysupgrade.bin := append-kernel | pad-to 64k | append-rootfs | pad-rootfs | check-size | append-metadata
endef
TARGET_DEVICES += qcom_rdp433

define Device/jiorouter-ax6000-jidu6j11
    $(call Device/FitImage)
	$(call Device/UbiFit)
    DEVICE_VENDOR := JioRouter
    DEVICE_MODEL := AX6000
    DEVICE_VARIANT := JIDU6J11

  	DEVICE_DTS_DIR := ../dts
    DEVICE_DTS := ipq9574-jiorouter-ax6000-jidu6j11
    SOC := ipq9574
    
    BLOCKSIZE := 128k
    PAGESIZE := 2048
    DEVICE_PACKAGES := \
		kmod-ath11k kmod-ath11k-pci ath11k-firmware-qcn9074 \
		kmod-ath11k-ahb ath11k-firmware-ipq9574 \
		kmod-usb3 kmod-usb-storage \
		block-mount kmod-fs-ext4 kmod-fs-vfat kmod-nls-cp437 kmod-nls-iso8859-1 \
		uboot-envtools mwan3 luci-app-mwan3 \
		luci-app-sqm-scripts iperf3 kmod-ledtrig-netdev

    IMAGES += squashfs-initramfs-uImage.itb
    IMAGE/sysupgrade.bin := sysupgrade-tar | append-metadata
endef
TARGET_DEVICES += jiorouter-ax6000-jidu6j11
