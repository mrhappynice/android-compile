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
