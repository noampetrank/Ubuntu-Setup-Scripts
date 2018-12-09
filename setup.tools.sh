#!/usr/bin/env bash

echo "Installing tools"

echo "Installing vs code"
wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
sudo dpkg -i vscode.deb
sudo apt-get install -f

echo "Installing Android Studio"
wget https://dl.google.com/dl/android/studio/ide-zips/3.2.1.0/android-studio-ide-181.5056338-linux.zip
unzip -q android-studio-ide-181.5056338-linux.zip
sudo mv android-studio /opt/

echo "Install chrome"
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# This is doubled on purpose.
sudo dpkg -i google-chrome*.deb
sudo apt-get install -f
sudo dpkg -i google-chrome*.deb

echo "Install emacs-mozc"
sudo apt update
sudo apt install -y emacs-mozc

echo "Install gnome-tweak-tool"
sudo apt install -y gnome-tweak-tool

echo "Install id3v2"
sudo apt install -y id3v2

echo "Install screen"
sudo apt install -y screen

echo "Install tree"
sudo apt install -y tree
