#!/usr/bin/env bash

export LFS=/mnt

if [ -z $LFS ]; then
  echo "\$LFS unset"
  exit 1
fi

if [ ! -e ${LFS} ] ; then
  echo "${LFS} not exists"
  exit 1
fi

# sudo chmod -R a+x tools
# tools/prepare.sh

# sudo su lfs -c "env -i HOME=$HOME TERM=$TERM LFS=$LFS LFS_SCRIPT_PATH=$PWD/tools PS1='\u:\w\$ ' $PWD/tools/build_tools.sh"
sudo chmod a+x scripts/*
scripts/chroot_post.sh
scripts/chroot_prepare.sh

cp -R scripts $LFS/
sudo chroot "$LFS" /usr/bin/env -i   \
    HOME=/root                  \
    TERM="$TERM"                \
    PS1='(lfs chroot) \u:\w\$ ' \
    PATH=/usr/bin:/usr/sbin \
    /scripts/begin.sh

scripts/chroot_post.sh
