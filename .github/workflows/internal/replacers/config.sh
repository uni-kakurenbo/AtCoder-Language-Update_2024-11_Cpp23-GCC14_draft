#!/bin/bash
set -eu

INSTALLER="$(sed -e '/^\#/d' ./dist/install.sh | tr -s ' \n')"
BUILDER="$(sed -e '/^\#/d' ./dist/compile.sh | tr -s ' \n')"

cat ./assets/warning.txt >./dist/install.toml
echo >>./dist/install.toml

dasel -r toml -w json <./src/install.toml |
    jq --arg installer "${INSTALLER}" '.install=$installer' |
    jq --arg builder "${BUILDER}" '.compile=$builder' |
    dasel -r json -w toml |
    tr -s ' \n' |
    sed -e 's/^\s*//g' >>./dist/install.toml

function format-version() {
    local target
    target="$(cat ./dist/install.toml)"

    if [[ $1 =~ ([0-9]+\.){1}[0-9]+(\.[0-9]+)? ]]; then
        echo "${target/$1/version = \'${BASH_REMATCH[0]}\'}" >./dist/install.toml
    fi
}

export -f format-version

grep -Po "version\s*=\s*['\"].*([0-9]+\.){1}[0-9]+(\.[0-9]+)?.*['\"]" ./dist/install.toml |
    xargs -d'\n' -I {} bash -c 'format-version "{}"'
