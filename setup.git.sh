#!/usr/bin/env bash
echo "setup git"
git config --global push.default simple
echo "checkout code"
cd
git clone https://github.com/Bugatone/Bugatone-Space.git
sudo chown -R buga:buga Bugatone-Space
ln -s Bugatone-Space git
pip install -e Bugatone-Space

git clone https://github.com/Bugatone/mobileproduct.git
pip install -e mobileproduct

git clone https://github.com/Bugatone/buga-recordings.git
sudo -H pip install -e buga-recordings
sudo -H pip install -e buga-recordings/bugatone_space

wget -q --show-progress https://github.com/git-lfs/git-lfs/releases/download/v2.4.2/git-lfs-linux-amd64-2.4.2.tar.gz
tar -xzf git-lfs-linux-amd64-2.4.2.tar.gz
sudo -H git-lfs-2.4.2/install.sh
rm -r git-lfs-2.4.2
rm git-lfs-linux-amd64-2.4.2.tar.gz
git lfs install
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

git clone https://github.com/Bugatone/test-files.git

git clone https://github.com/Bugatone/oppo_daemon.git

echo "Updating buga .profile file"
echo "export BUGATONE_ROOT=/home/buga/Bugatone-Space" >> ~/.profile
echo "export TEST_FILES_PATH=/home/buga/test-files" >> ~/.profile
echo "export LD_LIBRARY_PATH=.:/home/buga/Bugatone-Space/lib/linux_x86:\$LD_LIBRARY_PATH" >> ~/.profile
echo "export PATH=.:/home/buga/Bugatone-Space/bin/linux_x86:\$PATH" >> ~/.profile
echo "export PYTHONPATH=/home/buga/Bugatone-Space/python" >> ~/.profile
echo "export PATH=/opt/cmake/bin:\$PATH" >> ~/.profile
echo "export PATH=/home/buga/Android/Sdk/platform-tools:\$PATH" >> ~/.profile
source ~/.profile

echo "Updating root .bashrc"
echo "export BUGATONE_ROOT=/home/buga/Bugatone-Space" >> /root/.bashrc
echo "export TEST_FILES_PATH=/home/buga/test-files" >> /root/.bashrc
echo "export LD_LIBRARY_PATH=.:/home/buga/Bugatone-Space/lib/linux_x86:\$LD_LIBRARY_PATH" >> /root/.bashrc
echo "export PATH=.:/home/buga/Bugatone-Space/bin/linux_x86:\$PATH" >> /root/.bashrc
echo "export PYTHONPATH=/home/buga/Bugatone-Space/python" >> /root/.bashrc
echo "export PATH=/opt/cmake/bin:\$PATH" >> /root/.bashrc
echo "export PATH=/home/buga/Android/Sdk/platform-tools:\$PATH" >> /root/.bashrc
source /root/.bashrc

echo "make project"
cd Bugatone-Space
./make.sh linux
cd
cd mobileproduct
./make.py linux
cd
