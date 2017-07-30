echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
sudo apt-get install mono-devel mono-complete referenceassemblies-pcl ca-certificates-mono -y --force-yes
sudo apt-get install monodevelop monodevelop-nunit -y --force-yes

