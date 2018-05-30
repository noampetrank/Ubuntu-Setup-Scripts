#!/usr/bin/env bash
echo "copy some shortcuts to desktop"
cp ~/Bugatone-Space/python/scripts/shortcuts/* ~/Desktop/
echo "copy songs folder from storage to home/buga"
mkdir /home/buga/songs/
rsync -avzhP /mnt/buga/storage/songs/ /home/buga/songs/

