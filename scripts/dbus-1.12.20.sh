#!/usr/bin/env bash

echo ""
echo "D-Bus-1.12.20"
tar -xf dbus-1.12.20.tar.gz
cd dbus-1.12.20
./configure --prefix=/usr                        \
            --sysconfdir=/etc                    \
            --localstatedir=/var                 \
            --disable-static                     \
            --disable-doxygen-docs               \
            --disable-xml-docs                   \
            --docdir=/usr/share/doc/dbus-1.12.20 \
            --with-console-auth-dir=/run/console \
            --with-system-pid-file=/run/dbus/pid \
            --with-system-socket=/run/dbus/system_bus_socket
make
echo "D-Bus-1.12.20 make finished"
read -p "Press any key to continue ..."

make install
ln -sfv /etc/machine-id /var/lib/dbus

echo "D-Bus-1.12.20 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf dbus-1.12.20
