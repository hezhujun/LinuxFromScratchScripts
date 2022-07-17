#!/bin/env bash

echo ""
echo "Linux-5.16.9"

tar -xf linux-5.16.9.tar.xz
cd linux-5.16.9

make mrproper
make defconfig
make menuconfig LANG=$LANG LC_ALL=
make
make modules_install
echo "Linux-5.16.9 make finished"
read -p "Press any key to continue ..."

cp -iv arch/x86/boot/bzImage /boot/vmlinuz-5.16.9-lfs-11.1-systemd
cp -iv System.map /boot/System.map-5.16.9
cp -iv .config /boot/config-5.16.9
install -d /usr/share/doc/linux-5.16.9
cp -r Documentation/* /usr/share/doc/linux-5.16.9

install -v -m755 -d /etc/modprobe.d
cat > /etc/modprobe.d/usb.conf << "EOF"
# Begin /etc/modprobe.d/usb.conf

install ohci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i ohci_hcd ; true
install uhci_hcd /sbin/modprobe ehci_hcd ; /sbin/modprobe -i uhci_hcd ; true

# End /etc/modprobe.d/usb.conf
EOF

echo "Linux-5.16.9 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf linux-5.16.9
