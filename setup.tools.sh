#!/usr/bin/env bash

echo "Installing tools"

echo "Installing vs code"
wget "https://go.microsoft.com/fwlink/?LinkID=760868" -O vscode.deb
dpkg -i vscode.deb
apt-get install -f

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
