#!/usr/bin/env bash

CRED_FILE_BUGATONE_WIN_SERVER="/etc/BugaToneServerCredentials"
CRED_FILE_QNAP_STORAGE="/etc/BugaStorageQnapCredentials"

IP_WIN_SERVER="10.0.0.100"
IP_QNAP_STORAGE="10.0.0.115"

SHARE_WIN_SERVER="BugaTone"
SHARE_QNAP_BUGA="Buga"
SHARE_QNAP_PUB="Public"

FSTAB="/etc/fstab"

MOUNT_PRODUCTION_STORAGE="/mnt/buga_storage"
MOUNT_STAGING_STORAGE="/mnt/buga_old"
MOUNT_PUBLIC_STORAGE="/mnt/buga_pub"

USER_WIN_STORAGE="Buga"
PASS_WIN_STORAGE="!Stor@ge!"
DOMN_WIN_STORAGE="Bugatone"
USER_QNAP_STORAGE="Buga"
PASS_QNAP_STORAGE="buga"

USER_HOST="buga"

MOUNT_TYPE="cifs"
MOUNT_PARAMS="nofail,uid=1000,gid=1000,rw,iocharset=utf8"

echo "Configuring remote storage mounts"

echo "Installing required packages"
sudo apt-get install cifs-utils -y        >> /dev/null
sudo update-rc.d -f umountnfs.sh remove   >> /dev/null
sudo update-rc.d umountnfs.sh stop 15 0 6 >> /dev/null

if [ ! -f $CRED_FILE_BUGATONE_WIN_SERVER ]; then sudo touch "$CRED_FILE_BUGATONE_WIN_SERVER"; fi
if ! sudo grep -q "username" $CRED_FILE_BUGATONE_WIN_SERVER; then echo "username=$USER_WIN_STORAGE" | sudo tee -a $CRED_FILE_BUGATONE_WIN_SERVER > /dev/null; fi
if ! sudo grep -q "password" $CRED_FILE_BUGATONE_WIN_SERVER; then echo "password=$PASS_WIN_STORAGE" | sudo tee -a $CRED_FILE_BUGATONE_WIN_SERVER > /dev/null; fi
if ! sudo grep -q "domain" $CRED_FILE_BUGATONE_WIN_SERVER;   then echo "domain=$DOMN_WIN_STORAGE"   | sudo tee -a $CRED_FILE_BUGATONE_WIN_SERVER > /dev/null; fi
if ! sudo grep -q "vers" $CRED_FILE_BUGATONE_WIN_SERVER;     then echo 'vers=3.0'                   | sudo tee -a $CRED_FILE_BUGATONE_WIN_SERVER > /dev/null; fi
sudo chmod 640 $CRED_FILE_BUGATONE_WIN_SERVER
echo "Configured Windows server credentials file at: $CRED_FILE_BUGATONE_WIN_SERVER"

if [ ! -f $CRED_FILE_QNAP_STORAGE ]; then sudo touch "$CRED_FILE_QNAP_STORAGE"; fi
if ! sudo grep -q "username" $CRED_FILE_QNAP_STORAGE; then echo "username=$USER_QNAP_STORAGE" | sudo tee -a $CRED_FILE_QNAP_STORAGE > /dev/null; fi
if ! sudo grep -q "password" $CRED_FILE_QNAP_STORAGE; then echo "password=$PASS_QNAP_STORAGE" | sudo tee -a $CRED_FILE_QNAP_STORAGE > /dev/null; fi
sudo chmod 640 $CRED_FILE_QNAP_STORAGE
echo "Configured QNAP credentials file at: $CRED_FILE_QNAP_STORAGE"

echo "Create local folder for mounts"
if [ ! -d $MOUNT_PRODUCTION_STORAGE ]; then sudo mkdir $MOUNT_PRODUCTION_STORAGE; fi
if [ ! -d $MOUNT_STAGING_STORAGE ];    then sudo mkdir $MOUNT_STAGING_STORAGE;    fi
if [ ! -d $MOUNT_PUBLIC_STORAGE ];     then sudo mkdir $MOUNT_PUBLIC_STORAGE;     fi

echo "Setting mount directories ownership"
if [ `stat -c "%U" $MOUNT_PRODUCTION_STORAGE` == "$USER_HOST" ]; then sudo chown $USER_HOST:$USER_HOST $MOUNT_PRODUCTION_STORAGE; fi
if [ `stat -c "%U" $MOUNT_STAGING_STORAGE`    == "$USER_HOST" ]; then sudo chown $USER_HOST:$USER_HOST $MOUNT_STAGING_STORAGE;    fi
if [ `stat -c "%U" $MOUNT_PUBLIC_STORAGE`     == "$USER_HOST" ]; then sudo chown $USER_HOST:$USER_HOST $MOUNT_PUBLIC_STORAGE;     fi

sudo sed -i "/mnt\/buga_storage/d" $FSTAB
sudo sed -i "/mnt\/bugastorage/d" $FSTAB

CONFIG_WIN_MOUNT="//$IP_WIN_SERVER/$SHARE_WIN_SERVER $MOUNT_STAGING_STORAGE $MOUNT_TYPE $MOUNT_PARAMS,credentials=$CRED_FILE_BUGATONE_WIN_SERVER"
CONFIG_QNAP_BUGA="//$IP_QNAP_STORAGE/$SHARE_QNAP_BUGA $MOUNT_PRODUCTION_STORAGE $MOUNT_TYPE $MOUNT_PARAMS,credentials=$CRED_FILE_QNAP_STORAGE"
CONFIG_QNAP_PUB="//$IP_QNAP_STORAGE/$SHARE_QNAP_PUB $MOUNT_PUBLIC_STORAGE $MOUNT_TYPE $MOUNT_PARAMS,credentials=$CRED_FILE_QNAP_STORAGE"

if ! `sudo grep -q "$MOUNT_STAGING_STORAGE" $FSTAB`; then echo $CONFIG_WIN_MOUNT | sudo tee -a $FSTAB > /dev/null; fi
if ! `sudo grep -q "$MOUNT_PRODUCTION_STORAGE"    $FSTAB`; then echo $CONFIG_QNAP_BUGA | sudo tee -a $FSTAB > /dev/null; fi 
if ! `sudo grep -q "$MOUNT_PUBLIC_STORAGE"     $FSTAB`; then echo $CONFIG_QNAP_PUB  | sudo tee -a $FSTAB > /dev/null; fi 

sudo umount "/mnt/bugastorage"
sudo rm -rf "/mnt/bugastorage"

echo "Remounting..."
sudo mount -a
