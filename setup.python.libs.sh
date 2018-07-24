#!/usr/bin/env bash
echo "Python libs"


echo "python installations"
sudo -H pip install --upgrade pip
sudo -H pip install numpy
sudo -H pip install scipy
sudo -H python -m pip install -U pip setuptools
sudo -H pip install matplotlib
sudo -H pip install idlespork
sudo -H pip install pyalsaaudio
sudo -H pip install tqdm
sudo -H pip install progressbar2
sudo -H pip install Pyro4
sudo -H pip install pyserial
sudo -H pip install tables
sudo -H pip install pandas
sudo -H pip install symfit
sudo -H pip install pyusb==1.0.0b2 
sudo -H pip install flask
sudo -H pip install cbor
sudo -H pip install boto3
sudo -H pip install pygithub
sudo -H pip install subprocess32
sudo -H pip install twisted
sudo -H pip install requests
sudo -H pip install bs4
sudo -H pip install stopit
sudo -H pip install colorama
sudo -H pip install lxml
sudo -H pip install pathlib2
sudo -H pip install jinja2

# Something that's required for the demo guis.
apt install python-gi python-gi-cairo python3-gi python3-gi-cairo gir1.2-gtk-3.0
