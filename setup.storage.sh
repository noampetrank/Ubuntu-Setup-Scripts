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
MOUNT_STAGING_STORAGE="/mnt/bugastorage"
MOUNT_PUBLIC_STORAGE="/mnt/buga_pub"

USER_WIN_STORAGE="Buga"
PASS_WIN_STORAGE="!Stor@ge!"
DOMN_WIN_STORAGE="Bugatone"
USER_QNAP_STORAGE="Buga"
PASS_QNAP_STORAGE="buga"

USER_HOST="buga"

echo "Configuring remote storage mounts"

echo "Installing required packages"
sudo apt-get install cifs-utils -y
sudo update-rc.d -f umountnfs.sh remove
sudo update-rc.d umountnfs.sh stop 15 0 6 

if [ ! -f $CRED_FILE_BUGATONE_WIN_SERVER ]
then
    echo "Generating credentials file for Windows Storage Server"
    echo "username=$USER_WIN_STORAGE" | sudo tee -a $CRED_FILE_BUGATONE_WIN_SERVER
    echo "password=$PASS_WIN_STORAGE" | sudo tee -a $CRED_FILE_BUGATONE_WIN_SERVER
    echo "domain=$DOMN_WIN_STORAGE"   | sudo tee -a $CRED_FILE_BUGATONE_WIN_SERVER
    echo 'vers=3.0'                   | sudo tee -a $CRED_FILE_BUGATONE_WIN_SERVER
    sudo chmod 640 $CRED_FILE_BUGATONE_WIN_SERVER
    echo "Windows storage credentials file created successfully at $CRED_FILE_BUGATONE_WIN_SERVER"
else
    echo "$CRED_FILE_BUGATONE_WIN_SERVER already exists." 
fi

if [ ! -f $CRED_FILE_QNAP_STORAGE ]
then
    echo "Generating credentials file for the QNAP Buga Storage"
    echo "username=$USER_QNAP_STORAGE" | sudo tee -a $CRED_FILE_QNAP_STORAGE
    echo "password=$PASS_QNAP_STORAGE" | sudo tee -a $CRED_FILE_QNAP_STORAGE
    sudo chmod 640 $CRED_FILE_QNAP_STORAGE
    echo "QNAP buga storage credentials file created successfully at $CRED_FILE_QNAP_STORAGE"
else
    echo "$CRED_FILE_QNAP_STORAGE alread exists."
fi

echo "Create local folder for mounts"
[ ! -d $MOUNT_PRODUCTION_STORAGE ] && sudo mkdir $MOUNT_PRODUCTION_STORAGE
[ ! -d $MOUNT_STAGING_STORAGE    ] && sudo mkdir $MOUNT_STAGING_STORAGE
[ ! -d $MOUNT_PUBLIC_STORAGE     ] && sudo mkdir $MOUNT_PUBLIC_STORAGE

sudo chown $USER_HOST:$USER_HOST $MOUNT_PRODUCTION_STORAGE
echo "Edit $FSTAB"
echo "//$IP_WIN_SERVER/$SHARE_WIN_SERVER $MOUNT_PRODUCTION_STORAGE cifs nofail,credentials=$CRED_FILE_BUGATONE_WIN_SERVER,uid=1000,gid=1000,rw,iocharset=utf8" | sudo tee -a $FSTAB
echo "//$IP_QNAP_STORAGE/$SHARE_QNAP_BUGA $MOUNT_STAGING_STORAGE cifs nofail,credentials=$CRED_FILE_QNAP_STORAGE,uid=1000,gid=1000,rw,iocharset=utf8" | sudo tee -a $FSTAB
echo "//$IP_QNAP_STORAGE/$SHARE_QNAP_PUB $MOUNT_PUBLIC_STORAGE cifs nofail,credentials=$CRED_FILE_QNAP_STORAGE,uid=1000,gid=1000,rw,iocharset=utf8" | sudo tee -a $FSTAB

echo "Mount all new configurations"
sudo mount -a
