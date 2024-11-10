#!/bin/bash
set -eu

cd /tmp

sudo wget -q "https://github.com/atcoder/ac-library/releases/download/v${VERSION}/ac-library.zip" -O ./ac-library.zip
sudo unzip -q ./ac-library.zip -d /opt/ac-library/
