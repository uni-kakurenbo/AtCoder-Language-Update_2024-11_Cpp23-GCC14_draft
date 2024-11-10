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
    ./compile.sh

    {
        local header="================ ${name} ================"
        echo
        echo "${header}"
        ./a.out
        echo "${header//[^=]/=}"
        echo
        echo
    } >./log.txt
    cat ./log.txt
}

export -f run-test

time find ./ -type f -name '*.test.cpp' |
    xargs -P0 -I {} bash -c 'run-test {}'

cd ..
rm -rf ./tmp/
