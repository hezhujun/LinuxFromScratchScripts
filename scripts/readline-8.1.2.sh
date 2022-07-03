#!/usr/bin/env bash

echo ""
echo "Readline-8.1.2"
tar -xf readline-8.1.2.tar.gz
cd readline-8.1.2
sed -i '/MV.*old/d' Makefile.in
sed -i '/{OLDSUFF}/c:' support/shlib-install
./configure --prefix=/usr    \
            --disable-static \
            --with-curses    \
            --docdir=/usr/share/doc/readline-8.1.2
make SHLIB_LIBS="-lncursesw"
echo "Readline-8.1.2 make finished"
read -p "Press any key to continue ..."

make SHLIB_LIBS="-lncursesw" install
install -v -m644 doc/*.{ps,pdf,html,dvi} /usr/share/doc/readline-8.1.2

echo "Readline-8.1.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf readline-8.1.2
