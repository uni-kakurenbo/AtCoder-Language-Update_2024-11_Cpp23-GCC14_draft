#!/bin/bash
set -eu

cd /tmp/

mkdir -p ./light-gbm/

sudo wget -q "https://github.com/microsoft/LightGBM/releases/download/v${VERSION}/lightgbm-${VERSION}.tar.gz" -O ./light-gbm.tar.gz
sudo tar -I pigz -xf ./light-gbm.tar.gz -C ./light-gbm/ --strip-components 1

cd ./light-gbm/
sudo rm -rf ./lightgbm/

mkdir -p ./build/ && cd ./build/

sudo cmake -DCMAKE_INSTALL_PREFIX:PATH=/opt/light-gbm/ -DCMAKE_CXX_FLAGS:STRING="${COMPILE_OPTIONS[*]}" ../
sudo cmake --build ./ --target install --parallel "${PARALLEL}"