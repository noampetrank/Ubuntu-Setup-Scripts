echo "setup git"
echo "checkout code"
git clone https://github.com/Bugatone/Bugatone-Space.git
echo "Updating .profile file"
echo "export BUGATONE_ROOT=/home/buga/bugatone-space" >> ~/.profile
echo "export LD_LIBRARY_PATH=.:/home/buga/bugatone-space/lib/linux_x86:$LD_LIBRARY_PATH" >> ~/.profile
echo "export PATH=.:/home/buga/bugatone-space/bin/linux_x86:$PATH" >> ~/.profile
echo "export PYTHONPATH=/home/buga/bugatone-space/python" >> ~/.profile
echo "export PATH=/opt/cmake/bin:$PATH" >> ~/.profile
source ~/.profile
echo "make project"
make all -C ~/bugatone-space/

