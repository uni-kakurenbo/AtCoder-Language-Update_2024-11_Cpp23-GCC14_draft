#!/bin/bash
########## AUTO-GENERATED ##########
# Do not modify this file manually #
####################################
VERSION="6.3.0"

set -eu

mkdir ./gmp/

sudo wget "https://ftp.gnu.org/gnu/gmp/gmp-${VERSION}.tar.xz" -O gmp.tar.xz
sudo tar -Jvxf gmp.tar.xz -C ./gmp/ --strip-components 1

cd ./gmp/

sudo ./configure --enable-cxx --prefix=/opt
sudo make all
sudo make install
