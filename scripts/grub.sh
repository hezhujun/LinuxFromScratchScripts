#!/bin/env bash

grub-install /dev/sdb --target i386-pc
cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod ext4
set root=(hd0,1)

menuentry "GNU/Linux, Linux 5.16.9-lfs-11.1" {
        linux   /boot/vmlinuz-5.16.9-lfs-11.1 root=/dev/sda1 ro
}
EOF
