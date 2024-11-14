#!/bin/bash
set -eu

REQUIRED_PACKAGES=()

function apt-install() {
    sudo apt-get install "$1=$2"
    REQUIRED_PACKAGES+=("$1")
}

### GCC
apt-install g++-14 "${VERSION}"

### Libraries
sudo apt-get install -y build-essential pigz pbzip2

./sub-installers/abseil.sh
./sub-installers/AC-Library.sh
./sub-installers/Boost.sh
./sub-installers/Eigen.sh
./sub-installers/GMP.sh
./sub-installers/libtorch.sh
./sub-installers/range-v3.sh
./sub-installers/unordered_dense.sh

### Clean-up
mapfile -t UNNECESSARY_PACKAGES < <(
    dpkg --get-selections |
        xargs apt-cache show {} |
        awk -F ' *: *' '$1 == "Package" { p = $2; next } $1 == "Priority" && $2 ~ /(optional|extra)/ { print p }' |
        grep -v -E "^($(
            IFS='|'
            echo "${REQUIRED_PACKAGES[*]}"
        ))$"
)

echo "remove: ${UNNECESSARY_PACKAGES[*]}"
sudo apt-get remove --auto-remove -y "${UNNECESSARY_PACKAGES[@]}"
