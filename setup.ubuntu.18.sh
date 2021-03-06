echo Installing gcc 5
sudo apt install g++-5 gcc-5 -y

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++

########## DONE
# Same as in setup.code.dependencies. Not installing libatlas-dev as it was removed after 16.04, don't know if it will cause problems
# sudo apt-get install vim libfftw3-dev libatlas3-base libatlas-base-dev libblas-dev liblapack-dev gfortran python-gtk2 default-jdk binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev default-jdk bbe fping -y
########## DONE

# TODO: Installing cmake does not work, need to do it manually.
# https://askubuntu.com/a/865294
version=3.12
build=1
mkdir temp
cd temp
wget https://cmake.org/files/v$version/cmake-$version.$build.tar.gz
tar -xzvf cmake-$version.$build.tar.gz
cd cmake-$version.$build/
./bootstrap
make -j4
sudo make install
cd ../..


# TODO: Clang does not install all the way, not sure why. Running the commands manually worked.

# TODO: Compile swig from source:
# * need to apt install libpcre3-dev
# * Download tar for swig 3.0.8 and compile
