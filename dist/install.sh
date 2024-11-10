#!/bin/bash
########## AUTO-GENERATED ##########
# Do not modify this file manually #
####################################

set -eu

### GCC
sudo apt-get install -y g++-14=14.2.0-4ubuntu2~24.04

### Libraries
sudo apt-get install -y build-essential
cd /tmp

# AC-Library
VERSION="1.5.1"

set -ue

sudo wget "https://github.com/atcoder/ac-library/releases/download/v${VERSION}/ac-library.zip" -O ac-library.zip
sudo unzip /tmp/ac-library.zip -d /opt/ac-library/

# Boost
VERSION="1.86.0"

set -eu

mkdir -p ./boost/

sudo wget "https://archives.boost.io/release/${VERSION}/source/boost_${VERSION//./_}.tar.bz2" -O boost.tar.bz2
sudo tar -jvxf boost.tar.bz2 -C ./boost/ --strip-components 1

cd ./boost/

sudo ./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel

BUILD_ARGS=("-j3" "toolset=gcc" "threading=single" "variant=release" "link=static" "runtime-link=static" "cxxflags=\"-std=gnu++23\"")
sudo ./b2 "${BUILD_ARGS[@]}" stage
sudo ./b2 "${BUILD_ARGS[@]}" --prefix=/opt/boost/gcc install

# Eigen
VERSION="3.4.0-4"

set -eu

sudo apt-get install -y "libeigen3-dev=${VERSION}"

# GMP
VERSION="2:6.3.0+dfsg-2ubuntu6"

set -eu

sudo apt-get install -y "libgmp3-dev=${VERSION}"

