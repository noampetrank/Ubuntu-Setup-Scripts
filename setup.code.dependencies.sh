#!/usr/bin/env bash

echo "Installing dependencies"
sudo apt-get install vim libfftw3-dev libatlas3-base libatlas-dev libatlas-base-dev libblas-dev liblapack-dev gfortran python-gtk2 -y

echo "Installing cmake"
wget --quiet --show-progress https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.tar.gz
tar -xzf cmake-3.10.2-Linux-x86_64.tar.gz
sudo mv cmake-3.10.2-Linux-x86_64 /opt/cmake

echo "Installing vs code"
wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
dpkg -i vscode.deb
apt-get install -f

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
