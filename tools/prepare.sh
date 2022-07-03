#!/usr/bin/env bash

cp -r sources $LFS/sources

mkdir -pv $LFS/tools
mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) mkdir -pv $LFS/lib64 ;;
esac

sudo groupadd lfs
sudo useradd -s /bin/bash -g lfs -m -k /dev/null lfs

sudo chown -R lfs $LFS/{usr{,/*},lib,var,etc,bin,sbin,tools}
case $(uname -m) in
  x86_64) sudo chown -v lfs $LFS/lib64 ;;
esac

sudo chown -R lfs $LFS/sources
