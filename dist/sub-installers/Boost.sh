#!/bin/bash
########## AUTO-GENERATED ##########
# Do not modify this file manually #
####################################
VERSION="1.86.0"

set -eu

mkdir -p ./boost/

sudo wget "https://archives.boost.io/release/${VERSION}/source/boost_${VERSION//./_}.tar.bz2" -O boost.tar.bz2
sudo tar -I pbzip2 -vxf boost.tar.bz2 -C ./boost/ --strip-components 1

cd ./boost/

sudo ./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel

BUILD_ARGS=(-d0 "-j$(nproc)" "toolset=gcc" "threading=single" "variant=release" "link=static" "runtime-link=static" "cxxflags=\"-std=gnu++23\"")
sudo ./b2 "${BUILD_ARGS[@]}" stage
sudo ./b2 "${BUILD_ARGS[@]}" --prefix=/opt/boost/gcc/ install
