#!/bin/bash
set -ue

sudo wget "https://github.com/atcoder/ac-library/releases/download/v${VERSION}/ac-library.zip" -O ac-library.zip
sudo unzip /tmp/ac-library.zip -d /opt/ac-library/
