#!/bin/bash
set -eu

mkdir -p ./boost/

sudo wget "https://archives.boost.io/release/${VERSION}/source/boost_${VERSION//./_}.tar.bz2" -O boost.tar.bz2
sudo tar -jvxf boost.tar.bz2 -C ./boost/ --strip-components 1

cd "./boost/"

sudo ./bootstrap.sh --with-toolset=gcc --without-libraries=mpi,graph_parallel

BUILD_ARGS=("-j3" "toolset=gcc" "threading=single" "variant=release" "link=static" "runtime-link=static" "cxxflags=\"-std=gnu++23\"")
sudo ./b2 "${BUILD_ARGS[@]}" stage
sudo ./b2 "${BUILD_ARGS[@]}" --prefix=/opt/boost/gcc install
