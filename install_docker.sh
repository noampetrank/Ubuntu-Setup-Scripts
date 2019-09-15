sudo apt install -y docker.io
sudo apt install -y libportaudio2
sudo mkdir -p /etc/docker
sudo touch /etc/docker/daemon.json
sudo echo '{ "insecure-registries":["10.0.0.123:5000"] }' | sudo tee -a /etc/docker/daemon.json
sudo groupadd -f docker
sudo usermod -aG docker $USER
sudo service docker restart
echo "Please log out. Then log in and run this script again!!!"
docker image pull 10.0.0.123:5000/synapticsbase
