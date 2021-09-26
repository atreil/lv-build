#!/bin/bash -e

install -m 644 files/cmdline.txt "${ROOTFS_DIR}/boot/"
install -m 644 files/config.txt "${ROOTFS_DIR}/boot/"
touch "${ROOTFS_DIR}/boot/ssh"
echo 'ctrl_interface=DIR=/var/run/wpa_supplicant GROUP=netdev
update_config=1
country=US
network={
	ssid="${SSID:?must set SSID}"
	psk="${PSK:?must set PSK}"
	scan_ssid=1
}' > "${ROOTFS_DIR}/etc/wpa_supplicant/wpa_supplicant.conf"

echo "0" > tee "${ROOTFS_DIR}/var/lib/systemd/rfkill/*:wlan"
