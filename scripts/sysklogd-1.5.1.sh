#!/usr/bin/env bash

echo ""
echo "Sysklogd-1.5.1"
tar -xf sysklogd-1.5.1.tar.gz
cd sysklogd-1.5.1
sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c
make
echo "Sysklogd-1.5.1 make finished"
read -p "Press any key to continue ..."

make BINDIR=/sbin install
cat > /etc/syslog.conf << "EOF"
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF

echo "Sysklogd-1.5.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf sysklogd-1.5.1
