#!/usr/bin/env bash

echo "\$LFS=$LFS"
read -p "Press any key to continue ..."

sudo umount $LFS/dev/pts
sudo umount $LFS/{sys,proc,run,dev}
