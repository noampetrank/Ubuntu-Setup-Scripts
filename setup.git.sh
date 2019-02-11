#!/usr/bin/env bash
echo "setup git"
git config --global push.default simple
echo "checkout code"
cd
git clone https://github.com/Bugatone/Bugatone-Space.git
sudo chown -R buga:buga Bugatone-Space
ln -s Bugatone-Space git
pip install --user -e Bugatone-Space

git clone https://github.com/Bugatone/mobileproduct.git
pip install --user --process-dependency-links -e mobileproduct

git clone https://github.com/Bugatone/buga-recordings.git
pip install --user -e buga-recordings
pip install --user -e buga-recordings/bugatone_space

wget -q --show-progress https://github.com/git-lfs/git-lfs/releases/download/v2.4.2/git-lfs-linux-amd64-2.4.2.tar.gz
tar -xzf git-lfs-linux-amd64-2.4.2.tar.gz
sudo -H git-lfs-2.4.2/install.sh
rm -r git-lfs-2.4.2
rm git-lfs-linux-amd64-2.4.2.tar.gz
git lfs install
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

#git clone https://github.com/Bugatone/test-files.git
cp /mnt/buga_storage/test-files.tar.gz .
tar -xzf test-files.tar.gz

git clone https://github.com/Bugatone/oppo_daemon.git

git clone https://github.com/Bugatone/device_communication.git
cd ~/device_communication
git submodule update --init --recursive
cd -
pip install --process-dependency-links -e device_communication

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
sudo echo "export BUGATONE_ROOT=/home/buga/Bugatone-Space" >> /root/.bashrc
sudo echo "export TEST_FILES_PATH=/home/buga/test-files" >> /root/.bashrc
sudo echo "export LD_LIBRARY_PATH=.:/home/buga/Bugatone-Space/lib/linux_x86:\$LD_LIBRARY_PATH" >> /root/.bashrc
sudo echo "export PATH=.:/home/buga/Bugatone-Space/bin/linux_x86:\$PATH" >> /root/.bashrc
sudo echo "export PYTHONPATH=/home/buga/Bugatone-Space/python" >> /root/.bashrc
sudo echo "export PATH=/opt/cmake/bin:\$PATH" >> /root/.bashrc
sudo echo "export PATH=/home/buga/Android/Sdk/platform-tools:\$PATH" >> /root/.bashrc

echo "make project"
cd Bugatone-Space
./make.sh linux
cd
cd mobileproduct
./make.py linux
cd
