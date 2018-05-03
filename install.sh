#!/usr/bin/env bash
sudo apt-get update
sudo apt-get upgrade -y

# openssh install and mono (setup.net.sh) installations are temporarily commented out till we figure out what they are necessary for

./setup.code.dependencies.sh
./setup.alsa.sh
./setup.python.libs.sh
./setup.tools.sh
# ./setup.net.sh
./setup.git.sh
./setup.buga.directories.sh
./setup.openssh.sh
./setup.storage.sh
./setup.shortcuts.and.songs.sh
./setup.network.workaround.sh

sudo chown -R buga:buga /home/buga 
