### Instructions:

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
