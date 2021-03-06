#!/usr/bin/env bash

sudo apt-get update
sudo apt-get upgrade -y

echo "Installing basic tools"
sudo apt-get install vim gitk unzip python-setuptools build-essential python-dev libfftw3-dev libasound2-dev zlib1g-dev python-tk libatlas-dev libatlas-base-dev libblas-dev liblapack-dev gfortran swig awscli -y

echo "Installing clang"
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/xenial/ llvm-toolchain-xenial-5.0 main"
sudo apt-get update
sudo apt-get install -y clang-5.0
sudo update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-5.0 1000
sudo update-alternatives --install /usr/bin/clang clang /usr/bin/clang-5.0 1000
sudo update-alternatives --config clang --skip-auto
sudo update-alternatives --config clang++ --skip-auto

type cmake  &> /dev/null
if [ $? -eq 1 ]
then
    echo "Installing cmake"
    wget --quiet --show-progress https://cmake.org/files/v3.10/cmake-3.10.2-Linux-x86_64.tar.gz
    tar -xzf cmake-3.10.2-Linux-x86_64.tar.gz
    sudo mv cmake-3.10.2-Linux-x86_64 /opt/cmake
    rm -f cmake-3.10.2-Linux-x86_64.tar.gz
fi

if [ ! -d /opt/android-ndk-r16b ]
then
    echo "* Downloading ndk 16"
    wget --quiet --show-progress https://dl.google.com/android/repository/android-ndk-r16b-linux-x86_64.zip
    echo "* Extracting ndk 16"
    unzip -q android-ndk-r16b-linux-x86_64.zip
    echo "* Moving ndk 16 to /opt"
    sudo mv android-ndk-r16b /opt
    rm -f android-ndk-r16b-linux-x86_64.zip
fi

grep "export PATH=\/opt\/cmake\/bin\:\$PATH" ~/.profile  &> /dev/null
if [ $? -eq 1 ]
then
    echo "Adding cmake to PATH..."
    echo "export PATH=/opt/cmake/bin:\$PATH" >> ~/.profile
    echo "export AWS_ACCESS_KEY_ID=AKIASMHZ4KIOX7Z7MXE5" >> ~/.profile
    echo "export AWS_SECRET_ACCESS_KEY=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" >> ~/.profile
    source ~/.profile
fi

echo "Python installations"
sudo easy_install pip
sudo -H pip install --upgrade pip
sudo -H pip install numpy
sudo -H python -m pip install -U pip setuptools
sudo -H pip install subprocess32
sudo -H pip install BeautifulSoup4
sudo -H pip install colorama
sudo -H pip install tqdm
sudo -H pip install Pyro4
sudo -H pip install scipy
sudo -H pip install requests
sudo -H pip install cbor
sudo -H pip install stopit
sudo -H pip install pyserial
sudo -H pip install pyusb
sudo -H pip install pathlib2
sudo -H pip install jinja2
sudo -H pip install nose-exclude


echo "setup git"
git config --global push.default simple
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

cd
if [ ! -d Bugatone-Space ]
then
    echo "checkout Bugatone-Space"
    git clone https://github.com/Bugatone/Bugatone-Space.git
    sudo chown -R ubuntu:ubuntu Bugatone-Space
    sudo -H pip install -e Bugatone-Space
fi

if [ ! -d mobileproduct ]
then
    echo "checkout mobileproduct"
    git clone https://github.com/Bugatone/mobileproduct.git
    sudo -H pip install -e mobileproduct
fi

if [ ! -d test-files ]
then
    echo "sync test-files"
    aws s3 sync s3://buga-resources-test-files .
fi

grep "export BUGATONE_ROOT" ~/.profile  &> /dev/null
if [ $? -eq 1 ]
then
    echo "Updating buga .profile file"
    echo "export BUGATONE_ROOT=/home/ubuntu/Bugatone-Space" >> ~/.profile
    echo "export TEST_FILES_PATH=/home/ubuntu/test-files" >> ~/.profile
    echo "export LD_LIBRARY_PATH=.:/home/ubuntu/Bugatone-Space/lib/linux_x86:\$LD_LIBRARY_PATH" >> ~/.profile
    echo "export PATH=.:/home/ubuntu/Bugatone-Space/bin/linux_x86:\$PATH" >> ~/.profile
    echo "export PYTHONPATH=/home/ubuntu/Bugatone-Space/python" >> ~/.profile
    echo "export PATH=/opt/cmake/bin:\$PATH" >> ~/.profile
    source ~/.profile
fi

echo "Create bugatone folders..."
mkdir ~/tmp_dir
mkdir ~/buga_logs
cp ~/Ubuntu-Setup-Scripts/bugaconfig.ini /home/ubuntu/
find bugaconfig.ini -type f -exec sed -i 's/\bbuga\b/ubuntu/g' {} \;

sudo chown -R ubuntu:ubuntu /home/ubuntu 

echo "make Bugatone-Space"
cd Bugatone-Space
./make.sh linux

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
