sudo apt install -y docker.io
sudo apt install -y libportaudio2
sudo mkdir -p /etc/docker
sudo touch /etc/docker/daemon.json
sudo echo '{  }' | sudo tee -a /etc/docker/daemon.json # Don't really know if this line is necessary anymore
sudo groupadd -f docker
sudo usermod -aG docker $USER
sudo service docker restart
