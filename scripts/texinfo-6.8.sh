#!/usr/bin/env bash

echo ""
echo "Texinfo-6.8"
tar -xf texinfo-6.8.tar.xz
cd texinfo-6.8
./configure --prefix=/usr
sed -e 's/__attribute_nonnull__/__nonnull/' \
    -i gnulib/lib/malloc/dynarray-skeleton.c
make
echo "Texinfo-6.8 make finished"
read -p "Press any key to continue ..."

make check
echo "Texinfo-6.8 check finished"
read -p "Press any key to continue ..."

make install
make TEXMF=/usr/share/texmf install-tex
pushd /usr/share/info
  rm -v dir
  for f in *
    do install-info $f dir 2>/dev/null
  done
popd

echo "Texinfo-6.8 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf texinfo-6.8
