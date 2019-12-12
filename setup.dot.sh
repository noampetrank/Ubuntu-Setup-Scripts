#!/bin/sh
sudo apt install byacc bison flex python3-dev
mkdir -p /home/buga/.soft
cd /home/buga/.soft
curl https://gitlab.com/graphviz/graphviz/-/archive/master/graphviz-master.tar.gz --output graphviz-master.tar.gz
tar -xzvf graphviz-master.tar.gz
cd graphviz-master/
./autogen.sh
./configure --enable-perl=no
make
sudo make install
pip install --user git+https://github.com/drorspei/sismic-viz --upgrade
