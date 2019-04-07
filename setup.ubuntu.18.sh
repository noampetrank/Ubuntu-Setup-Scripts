echo Installing gcc 5
sudo apt install g++-5
sudo apt install gcc-5

sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 10
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-5 20
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 10
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-5 20
sudo update-alternatives --install /usr/bin/cc cc /usr/bin/gcc 30
sudo update-alternatives --set cc /usr/bin/gcc
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/g++ 30
sudo update-alternatives --set c++ /usr/bin/g++

# Not installing libatlas-dev as it was removed after 16.04, don't know if it will cause problems
sudo apt-get install vim libfftw3-dev libatlas3-base libatlas-base-dev libblas-dev liblapack-dev gfortran python-gtk2 default-jdk binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev default-jdk bbe fping -y

# TODO: Installing cmake does not work, need to do it manually.
# TODO: Clang does not install all the way, not sure why. Running the commands manually worked.
