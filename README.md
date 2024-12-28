# Launch Codespace to compile C to Android  

Here are step-by-step instructions to set up a GitHub Codespace with all necessary tools, including the Android NDK, to compile C code for ARM devices on Android. This setup will allow you to perform all development tasks directly within the Codespace.

### Step 1: Create the DevContainer Configuration

1. **Create the `.devcontainer` Folder:**
   - In the root of your repository, create a folder named `.devcontainer`.

2. **Create the `devcontainer.json` File:**
   - Inside the `.devcontainer` folder, create a file named `devcontainer.json` with the following content:

```json
{
  "name": "ARM Android DevContainer",
  "build": {
    "dockerfile": "Dockerfile"
  },
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-vscode.cpptools",
        "ms-azuretools.vscode-docker"
      ]
    }
  },
  "settings": {
    "terminal.integrated.shell.linux": "/bin/bash"
  },
  "remoteUser": "vscode"
}
```

### Step 2: Create the Dockerfile

1. **Create the Dockerfile:**
   - In the `.devcontainer` folder, create a file named `Dockerfile` with the following content:

```dockerfile
# Use the official VS Code devcontainers base image
FROM mcr.microsoft.com/vscode/devcontainers/base:0-bullseye

# Install necessary packages
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    curl \
    unzip \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Download and install Android NDK
ENV ANDROID_NDK_VERSION r23b
RUN curl -sSL https://dl.google.com/android/repository/android-ndk-${ANDROID_NDK_VERSION}-linux.zip -o /tmp/ndk.zip \
    && unzip /tmp/ndk.zip -d /usr/local/ \
    && rm /tmp/ndk.zip
ENV ANDROID_NDK_HOME=/usr/local/android-ndk-${ANDROID_NDK_VERSION}
ENV PATH=${ANDROID_NDK_HOME}/toolchains/llvm/prebuilt/linux-x86_64/bin:$PATH

# Setup a non-root user (vscode) with passwordless sudo
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID
RUN groupadd --gid $USER_GID $USERNAME \
    && useradd --uid $USER_UID --gid $USER_GID -m $USERNAME \
    && apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(ALL\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

USER $USERNAME
```

### Step 3: Push the Changes to Your Repository

1. **Commit and Push:**
   - Commit the changes to your repository:

```bash
git add .devcontainer
git commit -m "Add devcontainer configuration for ARM Android development"
git push origin main
```

### Step 4: Launch GitHub Codespace

1. **Open Your Repository on GitHub:**
   - Navigate to your repository on GitHub.

2. **Create a Codespace:**
   - Click on the `Code` button and select `Create codespace on main` (or the appropriate branch).

### Step 5: Verify the Environment

1. **Check Installed Tools:**
   - Once the Codespace starts, open a terminal in VS Code.
   - Verify that the necessary tools are installed by running the following commands:

```bash
make --version
gcc --version
g++ --version
cmake --version
```

2. **Check Android NDK:**
   - Verify that the Android NDK is available:

```bash
$ANDROID_NDK_HOME/ndk-build --version
```

### Step 6: Develop and Compile Your Code

1. **Copy Your Code:**
   - Open the VS Code web app and copy your code into the appropriate directories within the Codespace.

2. **Compile Your Code:**
   - Use the terminal to navigate to your code's directory.
   - Run the build commands, for example:

```bash
mkdir build
cd build
cmake ..
make
```

This setup allows you to download and configure the necessary software and tools within the GitHub Codespace, enabling you to develop and compile your C code for ARM devices on Android directly in the Codespace environment.
