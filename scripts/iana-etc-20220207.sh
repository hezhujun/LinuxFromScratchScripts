#!/usr/bin/env bash

echo ""
echo "Iana-Etc-20220207"
tar -xf iana-etc-20220207.tar.gz
cd iana-etc-20220207
cp services protocols /etc

echo "Iana-Etc-20220207 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf iana-etc-20220207
