echo "setup gRPC stuff..."
sudo apt install -y golang-go autoconf automake libtool curl make g++ unzip

cd ~/device_communication
git submodule update --init --recursive

cd 3rdparty/grpc/third_party/protobuf

./autogen.sh
./configure
make -j12
make check -j12
sudo make install
sudo ldconfig  # refresh shared library cache.

cd ../..
# In root grpc directory
make -j12
sudo make install

sudo -H pip install grpcio --ignore-installed
sudo -H pip install grpcio-tools googleapis-common-protos

echo "setup gRPC stuff done."
