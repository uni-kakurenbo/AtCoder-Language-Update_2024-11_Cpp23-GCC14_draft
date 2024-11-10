#!/bin/bash
set -eu

mkdir -p ./unordered_dense/

sudo wget "https://github.com/martinus/unordered_dense/archive/refs/tags/v${VERSION}.tar.gz" -O unordered_dense.tar.gz
sudo tar -I pigz -vxf unordered_dense.tar.gz -C ./unordered_dense/ --strip-components 1

cd ./unordered_dense/

mkdir -p ./build/ && cd ./build/
sudo cmake "-DCMAKE_INSTALL_PREFIX:PATH=/opt/unordered_dense/" ../
sudo cmake --build ./ --target install
