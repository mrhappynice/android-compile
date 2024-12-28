#!/bin/bash

set -e 

echo "Downloading and extracting NDK..."

curl -sSL https://dl.google.com/android/repository/android-ndk-r23b-linux.zip -o /tmp/android-ndk.zip

sudo unzip /tmp/android-ndk.zip -d /usr/local/


