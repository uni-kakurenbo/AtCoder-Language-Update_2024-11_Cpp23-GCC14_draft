#!/bin/bash
set -eu

rm -rf ./dist/
mkdir -p ./dist/

DIR="$(dirname "$0")"

"${DIR}/replacers/sub-installers.sh"
"${DIR}/replacers/installer.sh"
"${DIR}/replacers/builder.sh"
"${DIR}/replacers/config.sh"
