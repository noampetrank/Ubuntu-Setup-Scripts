sudo add-apt-repository -y ppa:janisozaur/cmake-update
sudo apt-get update
sudo apt-get install -y cmake=3.12.1-1~16.04.1ubuntu1
sed -i 's/export PATH=\/opt\/cmake\/bin\:\$PATH//g' ~/.profile
rm -rf 
sudo rm -rf /opt/cmake