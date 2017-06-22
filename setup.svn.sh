echo "setup svn"
echo "checkout code"
svn co https://subversion.assembla.com/svn/bugatone-space/trunk ~/svn
echo "set path follwing:"
echo "export BUGATONE_ROOT=/home/buga/svn"
echo "export LD_LIBRARY_PATH=.:/home/buga/svn/lib/linux_x86:$LD_LIBRARY_PATH"
echo "export PATH=.:/home/buga/svn/bin/linux_x86:$PATH"
echo "export PYTHONPATH=/home/buga/svn/python"
vim ~/.bashrc
sudo ~/.bashrc
source ~/.bashrc
echo "make project"
make all -C ~/svn/

