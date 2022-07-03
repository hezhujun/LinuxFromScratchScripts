#!/usr/bin/env bash

echo ""
echo "Meson-0.61.1"
tar -xf meson-0.61.1.tar.gz
cd meson-0.61.1
python3 setup.py build
echo "Meson-0.61.1 build finished"
read -p "Press any key to continue ..."

python3 setup.py install --root=dest
cp -rv dest/* /
install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson
install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson

echo "Meson-0.61.1 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf meson-0.61.1
