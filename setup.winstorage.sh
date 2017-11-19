#!/usr/bin/env bash

echo "Configuring Windows Share on Storage Server"
sudo apt-get install cifs-utils -y
sudo update-rc.d -f umountnfs.sh remove
sudo update-rc.d umountnfs.sh stop 15 0 6 
echo "Create a file for credentials information"
echo 'username=Buga'  | sudo tee -a /etc/BugaToneServerCredentials
echo 'password=!Stor@ge!' | sudo tee -a /etc/BugaToneServerCredentials
echo 'domain=BUGATONE' | sudo tee -a /etc/BugaToneServerCredentials
echo 'vers=3.0' | sudo tee -a /etc/BugaToneServerCredentials
echo "Change permissions"
sudo chmod 640 /etc/BugaToneServerCredentials
echo "Create local folder for mount"
sudo mkdir /mnt/buga_storage
sudo chown buga:buga /mnt/buga_storage
echo "Edit /etc/fstab"
echo '//10.0.0.100/BugaTone /mnt/buga_storage cifs nofail,credentials=/etc/BugaToneServerCredentials,uid=1000,gid=1000,rw,iocharset=utf8' | sudo tee -a /etc/fstab
echo "mount everything"
sudo mount -a
