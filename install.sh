#!/bin/bash
set -ue

sudo apt-get install -y g++-14

### Libraries
sudo apt-get install -y build-essential
cd /tmp

# AtCoder Library
sudo wget https://github.com/atcoder/ac-library/releases/download/v1.5.1/ac-library.zip -O ac-library.zip
sudo unzip /tmp/ac-library.zip -d /opt/ac-library/

# Boost
sudo wget https://archives.boost.io/release/1.86.0/source/boost_1_86_0.tar.bz2 -O boost_1_86_0.tar.bz2
sudo tar -jxf boost_1_86_0.tar.bz2

cd ./boost_1_86_0/

sudo ./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel

BUILD_ARGS=("-j3" "toolset=gcc" "threading=single" "variant=release" "link=static" "runtime-link=static" "cxxflags=\"-std=gnu++23\"")
sudo ./b2 "${BUILD_ARGS[@]}" stage
sudo ./b2 "${BUILD_ARGS[@]}" --prefix=/opt/boost/gcc install

# Eigen
sudo apt-get install -y libeigen3-dev

# GMP
sudo wget https://ftp.gnu.org/gnu/gmp/gmp-6.3.0.tar.xz -O gmp-6.3.0.tar.xz
sudo tar -Jxf gmp-6.3.0.tar.xz

cd ./gmp-6.3.0/

sudo ./configure --enable-cxx --prefix=/opt
sudo make all
sudo make install
