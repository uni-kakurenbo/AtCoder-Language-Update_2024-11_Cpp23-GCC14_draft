#!/bin/bash
set -eu

mkdir -p ./gmp/

sudo wget "https://ftp.gnu.org/gnu/gmp/gmp-${VERSION}.tar.xz" -O gmp.tar.xz
sudo tar -Jvxf gmp.tar.xz -C ./gmp/ --strip-components 1

cd ./gmp/

sudo ./configure --enable-cxx --prefix=/opt
sudo make all
sudo make install
