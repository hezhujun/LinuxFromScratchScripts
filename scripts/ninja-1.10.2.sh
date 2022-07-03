#!/usr/bin/env bash

echo ""
echo "Ninja-1.10.2"
tar -xf ninja-1.10.2.tar.gz
cd ninja-1.10.2
export NINJAJOBS=4
sed -i '/int Guess/a \
  int   j = 0;\
  char* jobs = getenv( "NINJAJOBS" );\
  if ( jobs != NULL ) j = atoi( jobs );\
  if ( j > 0 ) return j;\
' src/ninja.cc
python3 configure.py --bootstrap

./ninja ninja_test
./ninja_test --gtest_filter=-SubprocessTest.SetWithLots

echo "Ninja-1.10.2 test finished"
read -p "Press any key to continue ..."

install -vm755 ninja /usr/bin/
install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja
install -vDm644 misc/zsh-completion  /usr/share/zsh/site-functions/_ninja

echo "Ninja-1.10.2 finished"
read -p "Press any key to continue ..."
cd ..
rm -rf ninja-1.10.2
