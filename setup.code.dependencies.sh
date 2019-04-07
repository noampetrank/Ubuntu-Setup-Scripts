#!/usr/bin/env bash

echo "Installing dependencies"
# Ubuntu 18.04 does not have libatlas-dev, should only install libatlas-base-dev instead. I put the correct command in setup.ubuntu.18.sh
sudo apt-get install vim libfftw3-dev libatlas3-base libatlas-dev libatlas-base-dev libblas-dev liblapack-dev gfortran python-gtk2 default-jdk binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev default-jdk bbe fping python-tk -y

echo "Installing clang"
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
# TODO: Add -y flag
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"
sudo add-apt-repository ppa:janisozaur/cmake-update
sudo apt-get update
# TODO: CMake does not work on ubuntu 18.04
# Do this instead: https://askubuntu.com/questions/355565/how-do-i-install-the-latest-version-of-cmake-from-the-command-line
sudo apt-get install -y clang-5.0 cmake=3.12.1-1~16.04.1ubuntu1
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-3.8 100
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 1000
sudo update-alternatives --install /usr/bin/clang++ clang /usr/bin/clang-3.8 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-3.8 100
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 1000
sudo update-alternatives --config clang --skip-auto
sudo update-alternatives --config clang++ --skip-auto

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

sudo apt-get install meld gitk htop hardinfo swig -y

echo "* Downloading openlibm"
wget --quiet --show-progress https://github.com/JuliaLang/openlibm/archive/v0.4.1.zip
echo "* Extracting openlibm"
unzip -q v0.4.1.zip
echo "* Building openlibm"
cd openlibm-0.4.1
make
echo "* Installing openlibm"
sudo make install
cd ..
rm -rf openlibm-0.4.1
rm -f v0.4.1.zip

./install_kcov.sh

# Make dates appear in English in terminal
echo "export LC_TIME=en_US.UTF-8" >> ~/.profile
