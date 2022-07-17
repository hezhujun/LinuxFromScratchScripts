#!/usr/bin/env bash

echo ""
echo "Systemd-250"
tar -xf systemd-250.tar.gz
cd systemd-250
patch -Np1 -i ../systemd-250-upstream_fixes-1.patch
sed -i -e 's/GROUP="render"/GROUP="video"/' \
       -e 's/GROUP="sgx", //' rules.d/50-udev-default.rules.in

mkdir -p build
cd build
meson --prefix=/usr                 \
      --sysconfdir=/etc             \
      --localstatedir=/var          \
      --buildtype=release           \
      -Dblkid=true                  \
      -Ddefault-dnssec=no           \
      -Dfirstboot=false             \
      -Dinstall-tests=false         \
      -Dldconfig=false              \
      -Dsysusers=false              \
      -Db_lto=false                 \
      -Drpmmacrosdir=no             \
      -Dhomed=false                 \
      -Duserdb=false                \
      -Dman=false                   \
      -Dmode=release                \
      -Ddocdir=/usr/share/doc/systemd-250 \
      ..
ninja
echo "Systemd-250 make finished"
read -p "Press any key to continue ..."

ninja install
tar -xf ../../systemd-man-pages-250.tar.xz --strip-components=1 -C /usr/share/man
rm -rf /usr/lib/pam.d
systemd-machine-id-setup
systemctl preset-all

echo "Systemd-250 finished"
read -p "Press any key to continue ..."
cd ../..
rm -rf systemd-250
