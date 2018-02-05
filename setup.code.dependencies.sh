#!/usr/bin/env bash

echo "Installing dependencies"
sudo apt-get install vim libfftw3-dev libatlas3-base libatlas-dev libatlas-base-dev libblas-dev liblapack-dev gfortran python-gtk2 -y

echo "Installing cmake"
#wget https://cmake.org/files/v3.9/cmake-3.9.1-Linux-x86_64.tar.gz
#tar -xzf cmake-3.9.1-Linux-x86_64.tar.gz -C /opt
#mv /opt/cmake-3.9.1-Linux-x86_64 /opt/cmake

echo "Installing vs code"
#wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
#dpkg -i vscode.deb
#apt-get install -f

sudo apt-get install meld gitk -y
