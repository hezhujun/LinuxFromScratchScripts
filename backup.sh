#!/usr/bin/env bash

LFS=/home/hezhujun/Documents/code/LFS/lfs

sudo umount $LFS/dev/pts
sudo umount $LFS/{sys,proc,run,dev}

tar -cJpf $HOME/lfs-temp-tools-11.1.tar.xz ${LFS}
