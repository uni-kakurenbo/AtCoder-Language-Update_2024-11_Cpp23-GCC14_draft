#!/bin/bash
set -eu

### GCC
sudo apt-get install -y g++-14

### Libraries
sudo apt-get install -y build-essential
cd /tmp

./sub-installers/AC-Library.sh
./sub-installers/Boost.sh
./sub-installers/Eigen.sh
./installers/GMP.sh
