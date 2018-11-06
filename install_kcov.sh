sudo apt-get install -y binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev
git clone git@github.com:SimonKagstrom/kcov.git
cd kcov
mkdir build
cd build
cmake ..
make -j8
sudo make install
cd ..
cd ..
rm -rf kcov