#!/bin/bash
set -eu

VERSION="9.11"

cd /tmp/

mkdir -p ./or-tools/

sudo wget -q "https://github.com/google/or-tools/archive/refs/tags/v${VERSION}.tar.gz" -O ./or-tools.tar.gz
sudo tar -I pigz -xf ./or-tools.tar.gz -C ./or-tools/ --strip-components 1

cd ./or-tools/

sudo cmake -S . -B build -DCMAKE_INSTALL_PREFIX:PATH=/opt/or-tools/
sudo cmake --build build --config Release --target install -j -v
sudo cmake --build build --config Release --target test -v

ls /opt/or-tools/
