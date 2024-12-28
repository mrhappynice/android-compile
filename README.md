# Instructions:

## Compile for Termux on Android:

- **Compile code to Termux or Android terminal:**
```bash
sudo apt-get update && sudo apt-get install -y wget tar && wget https://releases.linaro.org/components/toolchain/binaries/latest-7/arm-linux-gnueabihf/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz && sudo tar -xf gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf.tar.xz -C /opt && sudo ln -s /opt/gcc-linaro-7.5.0-2019.12-x86_64_arm-linux-gnueabihf/bin/* /usr/local/bin/
```

- Compile the C code:
```bash
arm-linux-gnueabihf-gcc hello.c -o hello_arm
```

- Compress:
```bash
tar -czvf hello_arm.tar.gz hello_arm
```

- Download and transfer to device then:
```bash
tar -xzvf hello_arm.tar.gz
chmod +x hello_arm
```

## For Android app:

- **Download and extract NDK:**
```bash
chmod +x ndk-setup.sh
```
```bash
./ndk-setup.sh
```


- **Set the Environment Variables:**
   - Set the `ANDROID_NDK_HOME` environment variable to the path of the extracted NDK. Add this to your shell profile to persist across sessions:

```bash
export ANDROID_NDK_HOME=/usr/local/android-ndk-r23b
```
```bash
export PATH=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH
```  
### Add to .bashrc or .profile to persist  
```bash
echo 'export ANDROID_NDK_HOME=/usr/local/android-ndk-r23b' >> ~/.bashrc
```
```bash
echo 'export PATH=$ANDROID_NDK_HOME/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH' >> ~/.bashrc
```  
```bash
source ~/.bashrc
```

- **Verify Installation:**
   - Check if the NDK is installed correctly and the environment variables are set:

```bash
$ANDROID_NDK_HOME/ndk-build --version
```

You should now have a fully functional development environment in your GitHub Codespace, with the Android NDK properly installed and configured.
