echo "setup git"
echo "checkout code"
git clone https://github.com/Bugatone/Bugatone-Space.git bugatone-space
echo "set path follwing:"
echo "export BUGATONE_ROOT=/home/buga/bugatone-space" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=.:/home/buga/bugatone-space/lib/linux_x86:$LD_LIBRARY_PATH" >> ~/.bashrc
echo "export PATH=.:/home/buga/bugatone-space/bin/linux_x86:$PATH" >> ~/.bashrc
echo "export PYTHONPATH=/home/buga/bugatone-space/python" >> ~/.bashrc
source ~/.bashrc
echo "make project"
make all -C ~/bugatone-space/

