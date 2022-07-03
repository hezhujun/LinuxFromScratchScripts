#!/usr/bin/env bash

echo ""
echo "XML::Parser-2.46"
tar -xf XML-Parser-2.46.tar.gz
cd XML-Parser-2.46
perl Makefile.PL

make
echo "XML::Parser-2.46 make finished"
read -p "Press any key to continue ..."

make test
echo "XML::Parser-2.46 test finished"
read -p "Press any key to continue ..."

make install

echo "XML::Parser-2.46 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf XML-Parser-2.46
