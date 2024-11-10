#!/bin/bash
set -eu

cd /tmp/

sudo wget -q "https://download.pytorch.org/libtorch/cpu/libtorch-shared-with-deps-${VERSION}%2Bcpu.zip" -O ./libtorch.zip
sudo unzip -oq ./libtorch.zip -d ./

sudo mkdir -p /opt/libtorch/include/libtorch/
sudo mkdir -p /opt/libtorch/lib/libtorch/

sudo cp -Trf ./libtorch/include/ /opt/libtorch/include/
sudo cp -Trf ./libtorch/lib/ /opt/libtorch/lib/

# g++ example-app.cpp -I${install_root}/include -I${install_root}/include/torch/csrc/api/include -D_GLIBCXX_USE_CXX11_ABI=0 -std=gnu++14 -L${install_root}/lib -Wl,-R${install_root}/lib -ltorch -ltorch_cpu -lc10 -o example-app
