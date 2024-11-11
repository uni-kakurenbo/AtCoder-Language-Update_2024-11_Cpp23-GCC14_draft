#!/bin/bash
set -eu

cd ./test/
mkdir -p ./tmp/

function run-test() {
    set -eu

    local name
    name="$(dirname "$1")/$(basename "$1")"

    local directory="./tmp/${name}"

    mkdir -p "${directory}"
    cp ../dist/compile.sh "${directory}/compile.sh"
    cp "$1" "${directory}/Main.cpp"

    cd "${directory}/"
    chmod +x ./compile.sh

    {
        local header="================ ${name} ================"
        echo "${header}"
        ./compile.sh
        echo
        echo "${header//[^\$]/-}"
        ./a.out
        echo "${header//[^=]/=}"
        echo
        echo
    } >&./log.txt
    cat ./log.txt
}

export -f run-test

find ./ -type f -name '*.test.cpp' -print0 |
    xargs -0 "-P$(nproc)" -I {} bash -c 'run-test {}'

cd ..
rm -rf ./tmp/
