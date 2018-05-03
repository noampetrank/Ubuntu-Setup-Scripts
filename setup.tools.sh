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
sudo apt-get update
sudo apt-get install emacs-mozc

echo "Install gnome-tweak-tool"
sudo apt install gnome-tweak-tool

echo "Install id3v2"
sudo apt-get install id3v2

echo "Install keepassx"
sudo apt-get install keepassx

echo "Install mpv"
sudo apt install mpv

echo "Install screen"
sudo apt-get install screen

echo "Install tree"
sudo apt-get install tree
