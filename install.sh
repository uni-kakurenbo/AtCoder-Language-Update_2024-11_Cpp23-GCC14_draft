#!/bin/bash
set -ue

sudo apt install -y g++-14

### Libraries
sudo apt install -y build-essential
cd /tmp

# Eigen
sudo apt install -y libeigen3-dev=3.4.0-2ubuntu2

# AtCoder Library
sudo mkdir /opt/ac-library/

wget https://github.com/atcoder/ac-library/releases/download/v1.5.1/ac-library.zip -O ac-library.zip
sudo unzip /tmp/ac-library.zip -d /opt/ac-library/

# GMP
wget https://gmplib.org/download/gmp/gmp-6.3.0.tar.xz -O gmp-6.3.0.tar.xz
sudo tar -jxfv gmp-6.3.0.tar.xz

cd ./gmp-6.3.0/

./cofigure --prefix=/opt
make all
make install

cd ../

# Boost
wget https://archives.boost.io/release/1.86.0/source/boost_1_86_0.tar.bz2 -O boost_1_86_0.tar.bz2
sudo tar -jxvf boost_1_86_0.tar.bz2

cd ./boost_1_86_0/

./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel

build_args=(-j3 "toolset=gcc" "variant=release" "link=static" "runtime-link=static" "cxxflags=\"-std=gnu++23\"")
sudo ./b2 "${build_args[@]}" stage
sudo ./b2 "${build_args[@]}" --prefix=/opt/boost/gcc install
