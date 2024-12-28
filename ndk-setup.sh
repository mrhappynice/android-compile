#!/bin/bash

set -e 

curl -sSL https://dl.google.com/android/repository/android-ndk-r23b-linux.zip -o /tmp/android-ndk.zip

sudo unzip /tmp/android-ndk.zip -d /usr/local/

source exports.sh

echo 'export ANDROID_NDK_HOME=/usr/local/android-ndk-r23b' >> ~/.bashrc
echo 'export PATH=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH' >> ~/.bashrc
source ~/.bashrc
