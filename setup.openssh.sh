#!/usr/bin/env bash

# No idea what this is needed for
echo "OpenSSH installation"
sudo apt-get install openssh-server -y
sudo systemctl restart sshd.service
