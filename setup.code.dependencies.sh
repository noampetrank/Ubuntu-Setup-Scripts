#!/usr/bin/env bash

echo "Installing dependencies"
sudo apt-get install vim libfftw3-dev libatlas3-base libatlas-dev libatlas-base-dev libblas-dev liblapack-dev gfortran python-gtk2 -y

echo "Installing clang"
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"
sudo apt-get update
sudo apt-get install -y clang-5.0
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.8 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 1000
sudo update-alternatives --install /usr/bin/clang++ clang /usr/bin/clang-3.8 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.8 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 1000
sudo update-alternatives --config clang --skip-auto
sudo update-alternatives --config clang++ --skip-auto

echo "Installing cmake"
wget --quiet --show-progress https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.tar.gz
tar -xzf cmake-3.10.2-Linux-x86_64.tar.gz
sudo mv cmake-3.10.2-Linux-x86_64 /opt/cmake

echo "Installing vs code"
wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
dpkg -i vscode.deb
apt-get install -f

echo "Install chrome"
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# This is doubled on purpose.
sudo dpkg -i google-chrome*.deb
sudo apt-get install -f
sudo dpkg -i google-chrome*.deb

echo "* Downloading ndk 16"
wget --quiet --show-progress https://dl.google.com/android/repository/android-ndk-r16b-linux-x86_64.zip
echo "* Extracting ndk 16"
unzip -q android-ndk-r16b-linux-x86_64.zip
echo "* Moving ndk 16 to /opt"
sudo mv android-ndk-r16b /opt
#https://dl.google.com/android/repository/android-ndk-r11c-linux-x86_64.zip

echo "* Downloading ndk 11"
wget --quiet --show-progress https://dl.google.com/android/repository/android-ndk-r11c-linux-x86_64.zip
echo "* Extracting ndk 11"
unzip -q android-ndk-r11c-linux-x86_64.zip
echo "* Moving ndk 11 to /opt"
sudo mv android-ndk-r11c /opt

sudo apt-get install meld gitk htop -y
