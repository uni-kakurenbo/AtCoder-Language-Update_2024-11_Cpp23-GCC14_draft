#!/bin/bash
set -eu

INSTALLER=$(cat ./dist/install.sh)
BUILDER=$(cat ./src/compile.sh)

TARGET=$(cat ./src/install.toml)

mkdir -p ./dist/

TARGET="${TARGET//"\${{ref:installer}}"/"\n${INSTALLER}\n"}"

cat ./assets/warning.txt >./dist/install.toml
echo >>./dist/install.toml

echo -e "${TARGET//"\${{ref:builder}}"/"\n${BUILDER}\n"}" >>./dist/install.toml

function format-version() {
    local target
    target="$(cat ./dist/install.toml)"

    echo "$1"

    if [[ $1 =~ ([0-9]+\.){1}[0-9]+(\.[0-9]+)? ]]; then
        echo "${target/$1/version = \'${BASH_REMATCH[0]}\'}" >./dist/install.toml
    fi
}

export -f format-version

grep -Po "version\s*=\s*['\"].*([0-9]+\.){1}[0-9]+(\.[0-9]+)?.*['\"]" ./dist/install.toml |
    xargs -d'\n' -I {} bash -c 'format-version "{}"'
