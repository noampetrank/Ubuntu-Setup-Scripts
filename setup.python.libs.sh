#!/usr/bin/env bash
echo "Python libs"


echo "python installations"
sudo pip install --upgrade pip
sudo pip install numpy
sudo pip install scipy
sudo python -m pip install -U pip setuptools
sudo pip install matplotlib
sudo pip install idlespork
sudo pip install pyalsaaudio
sudo pip install tqdm
sudo pip install progressbar2
sudo pip install Pyro4
sudo pip install pyserial
sudo pip install tables
sudo pip install pandas
sudo pip install symfit
sudo pip install pyusb==1.0.0b2 
sudo pip install flask
sudo pip install cbor
sudo pip install boto3
sudo pip install pygithub
sudo pip install subprocess32
sudo pip install twisted
sudo pip install requests
sudo pip install bs4
sudo pip install stopit

# Something that's required for the demo guis.
apt install python-gi python-gi-cairo python3-gi python3-gi-cairo gir1.2-gtk-3.0
