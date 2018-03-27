#!/usr/bin/env bash
echo "setup git"
git config --global push.default simple
echo "checkout code"
cd
git clone https://github.com/Bugatone/Bugatone-Space.git
sudo chown -R buga:buga Bugatone-Space
ln -s Bugatone-Space git

git clone https://github.com/Bugatone/mobileproduct.git

echo "Updating buga .profile file"
echo "export BUGATONE_ROOT=/home/buga/Bugatone-Space" >> ~/.profile
echo "export LD_LIBRARY_PATH=.:/home/buga/Bugatone-Space/lib/linux_x86:\$LD_LIBRARY_PATH" >> ~/.profile
echo "export PATH=.:/home/buga/Bugatone-Space/bin/linux_x86:\$PATH" >> ~/.profile
echo "export PYTHONPATH=/home/buga/Bugatone-Space/python" >> ~/.profile
echo "export PATH=/opt/cmake/bin:\$PATH" >> ~/.profile
echo "export PATH=/home/buga/Android/Sdk/platform-tools:\$PATH" >> ~/.profile
source ~/.profile

echo "Updating root .bashrc"
echo "export BUGATONE_ROOT=/home/buga/Bugatone-Space" >> /root/.bashrc
echo "export LD_LIBRARY_PATH=.:/home/buga/Bugatone-Space/lib/linux_x86:\$LD_LIBRARY_PATH" >> /root/.bashrc
echo "export PATH=.:/home/buga/Bugatone-Space/bin/linux_x86:\$PATH" >> /root/.bashrc
echo "export PYTHONPATH=/home/buga/Bugatone-Space/python" >> /root/.bashrc
echo "export PATH=/opt/cmake/bin:\$PATH" >> /root/.bashrc
echo "export PATH=/home/buga/Android/Sdk/platform-tools:\$PATH" >> /root/.bashrc
source /root/.bashrc

echo "make project"
cd Bugatone-Space
./make.sh linux

