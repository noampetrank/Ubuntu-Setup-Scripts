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
cd mobileproduct
git submodule update --init --recursive
cd -
pip install --user -e mobileproduct

git clone https://github.com/Bugatone/buga-recordings.git
pip install --user -e buga-recordings
pip install --user -e buga-recordings/bugatone_space

git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

git clone https://github.com/Bugatone/oppo_daemon.git

git clone https://github.com/Bugatone/device_communication.git
cd ~/device_communication
git submodule update --init --recursive
cd -
pip install --user -e device_communication

git clone git@github.com:drorspei/sismic-viz.git

echo "Updating buga .profile file"
echo "export BUGATONE_ROOT=/home/buga/Bugatone-Space" >> ~/.profile
echo "export TEST_FILES_PATH=/home/buga/test-files" >> ~/.profile
echo "export LD_LIBRARY_PATH=.:/home/buga/Bugatone-Space/lib/linux_x86:\$LD_LIBRARY_PATH" >> ~/.profile
echo "export PATH=.:/home/buga/Bugatone-Space/bin/linux_x86:\$PATH" >> ~/.profile
echo "export PYTHONPATH=/home/buga/Bugatone-Space/python" >> ~/.profile
echo "export PATH=/opt/cmake/bin:\$PATH" >> ~/.profile
echo "export PATH=/home/buga/Android/Sdk/platform-tools:\$PATH" >> ~/.profile
echo "export AWS_ACCESS_KEY_ID=AKIASMHZ4KIOX7Z7MXE5" >> ~/.profile
echo "export AWS_SECRET_ACCESS_KEY=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" >> ~/.profile
echo "export AWS_ACCESS_KEY_ID=AKIASMHZ4KIOX7Z7MXE5" >> ~/.profile
echo "export AWS_SECRET_ACCESS_KEY=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" >> ~/.profile
echo "export ANDROID_HOME=/home/buga/Android/Sdk/" >> ~/.profile
source ~/.profile

echo "Updating root .bashrc"
sudo echo "export BUGATONE_ROOT=/home/buga/Bugatone-Space" >> /root/.bashrc
sudo echo "export TEST_FILES_PATH=/home/buga/test-files" >> /root/.bashrc
sudo echo "export LD_LIBRARY_PATH=.:/home/buga/Bugatone-Space/lib/linux_x86:\$LD_LIBRARY_PATH" >> /root/.bashrc
sudo echo "export PATH=.:/home/buga/Bugatone-Space/bin/linux_x86:\$PATH" >> /root/.bashrc
sudo echo "export PYTHONPATH=/home/buga/Bugatone-Space/python" >> /root/.bashrc
sudo echo "export PATH=/opt/cmake/bin:\$PATH" >> /root/.bashrc
sudo echo "export PATH=/home/buga/Android/Sdk/platform-tools:\$PATH" >> /root/.bashrc
sudo echo "export ANDROID_HOME=/home/buga/Android/Sdk/" >> /root/.bashrc

echo Copying test-files
cp /mnt/buga_storage/test-files.tar.gz .
tar -xzf test-files.tar.gz
echo Syncing test-files
cd test-files
sudo apt install -y awscli
source ~/.profile
aws s3 sync s3://buga-resources-test-files .
cd ..

echo "make project"
cd Bugatone-Space
./make.sh linux
cd
cd mobileproduct
./make.py linux
cd
