#!/bin/bash
set -eu

sudo wget "https://ftp.gnu.org/gnu/gmp/gmp-${VERSION}.tar.xz" -O gmp.tar.xz
sudo tar -Jxf gmp.tar.xz

cd ./gmp/

sudo ./configure --enable-cxx --prefix=/opt
sudo make all
sudo make install
