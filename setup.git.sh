#!/usr/bin/env bash
echo "setup git"
git config --global push.default simple
echo "checkout code"
cd
git clone https://github.com/Bugatone/Bugatone-Space.git
sudo chown -R buga:buga Bugatone-Space
ln -s Bugatone-Space git
echo "Updating .profile file"
echo "export BUGATONE_ROOT=/home/buga/Bugatone-Space" >> ~/.profile
echo "export LD_LIBRARY_PATH=.:/home/buga/Bugatone-Space/lib/linux_x86:\$LD_LIBRARY_PATH" >> ~/.profile
echo "export PATH=.:/home/buga/Bugatone-Space/bin/linux_x86:\$PATH" >> ~/.profile
echo "export PYTHONPATH=/home/buga/Bugatone-Space/python" >> ~/.profile
echo "export PATH=/opt/cmake/bin:\$PATH" >> ~/.profile
source ~/.profile
echo "make project"
cd Bugatone-Space
./make.sh linux

