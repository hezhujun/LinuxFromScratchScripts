#!/usr/bin/env bash

echo ""
echo "GRUB-2.06"
tar -xf grub-2.06.tar.xz
cd grub-2.06
./configure --prefix=/usr          \
            --sysconfdir=/etc      \
            --disable-efiemu       \
            --disable-werror
make
echo "GRUB-2.06 make finished"
read -p "Press any key to continue ..."

make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions

echo "GRUB-2.06 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf grub-2.06
