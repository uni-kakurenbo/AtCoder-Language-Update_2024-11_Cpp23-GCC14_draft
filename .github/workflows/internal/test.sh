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
    cp ../compile.sh "${directory}/compile.sh"
    cp "$1" "${directory}/Main.cpp"

    cd "${directory}/"
    ./compile.sh

    {
        echo -n "${name}: "
        ./a.out
        echo
    } >./log.txt
    cat ./log.txt
}

export -f run-test

time find ./ -type f -name '*.test.cpp' |
    xargs -P0 -I {} bash -c 'run-test {}'

cd ..
rm -rf ./tmp/
