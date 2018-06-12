#!/usr/bin/env bash

wget -q --show-progress https://github.com/git-lfs/git-lfs/releases/download/v2.4.2/git-lfs-linux-amd64-2.4.2.tar.gz
tar -xzf git-lfs-linux-amd64-2.4.2.tar.gz
git-lfs-2.4.2/install.sh
rm -r git-lfs-2.4.2
rm git-lfs-linux-amd64-2.4.2.tar.gz

echo "Done :)"
