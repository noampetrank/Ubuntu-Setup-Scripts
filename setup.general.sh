#!/usr/bin/env bash
echo "Linux setup - general, ALSA Support and Python"
sudo apt-get update
sudo apt-get upgrade -y

echo "general installations"
sudo apt-get install subversion vim libfftw3-dev -y
sudo apt-get install libatlas3-base libatlas-dev libatlas-base-dev libblas-dev liblapack-dev gfortran -y

echo "ALSA installations"
sudo apt-get install libasound2-dev libncurses5-dev libncursesw5 libncursesw5-dev xmlto -y
sudo apt-get install python-pip python-dev -y
sudo apt-get install dvipng -y
sudo apt-get install idle -y
sudo apt-get install libhdf5-serial-dev -y

echo "python installations"
sudo pip install --upgrade pip
sudo pip install numpy
sudo pip install scipy
sudo python -m pip install -U pip setuptools
sudo pip install matplotlib
sudo pip install idlespork
sudo pip install pyalsaaudio
sudo pip install tqdm
sudo pip install progressbar2
sudo pip install Pyro4
sudo pip install pyserial
sudo pip install tables
sudo pip install pandas
sudo pip install symfit
sudo pip install pyusb==1.0.0b2 
sudo pip install flask
sudo pip install cbor
sudo pip install boto3
sudo pip install pygithub
sudo pip install subprocess32
sudo pip install twisted
sudo pip install requests
sudo pip install bs4

echo "cmake install"
wget https://cmake.org/files/v3.9/cmake-3.9.1-Linux-x86_64.tar.gz
tar -xzf cmake-3.9.1-Linux-x86_64.tar.gz -C /opt
mv /opt/cmake-3.9.1-Linux-x86_64 /opt/cmake
