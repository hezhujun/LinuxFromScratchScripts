#!/usr/bin/env bash

echo ""
echo "Man-pages-5.13"
tar -xf man-pages-5.13.tar.xz
cd man-pages-5.13
make prefix=/usr install

echo "Man-pages-5.13 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf man-pages-5.13
