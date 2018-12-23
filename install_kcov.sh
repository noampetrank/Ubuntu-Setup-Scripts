sudo apt-get install -y binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev
git clone https://github.com/SimonKagstrom/kcov.git
echo "* Building kcov"
cd kcov
mkdir build
cd build
/opt/cmake/bin/cmake ..
make -j8
echo "* Installing kcov"
sudo make install
cd ..
cd ..
rm -rf kcov

