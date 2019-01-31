#!/usr/bin/env bash
echo "create bugatone folders"
mkdir ~/experiments
mkdir ~/experiments/parameters
mkdir ~/tmp_dir
mkdir ~/buga_logs
cp bugaconfig.ini /home/buga/
sudo cp bugaconfig.ini /root/
sudo chown -R buga:buga ~/experiments ~/tmp_dir ~/buga_logs /root/bugaconfig.ini /home/buga/bugaconfig.ini
