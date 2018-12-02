error() {
    echo -e "\e[91m$1\e[0m"
}

get_yes_no_answer() {
    while true; do
        read -p "$1 [y/n] " answer
        case $answer in
            [Yy]* ) return 1;;
            [Nn]* ) return 0;;
            * ) echo -e "\e[91mInvalid input. Please answer 'y' or 'n'";;
        esac
    done
}

cd
echo "Cloning buga-recordings..."
git clone https://github.com/Bugatone/buga-recordings.git
echo "Cloning buga-recordings done"
echo "Installing pybugarec..."
sudo -H pip install -e buga-recordings
echo "Installing pybugarec done"
echo "Installing pybugarecspace..."
sudo -H pip install -e buga-recordings/bugatone_space
echo "Installing pybugarecspace done"


echo "Copying mute.mp3 into ~/songs..."
mkdir songs > /dev/null
cp /mnt/buga_storage/songs/mute.mp3 songs
echo "Copying mute.mp3 done"

get_yes_no_answer "Do you want to override your current bugaconfig.ini?"
if [ $? -eq 0 ]
then
    error "IMPORTANT! Please add the following values to bugaconfig.ini:"
    error "* mobileproduct_oppo_archives_path - should be: /mnt/buga_storage/loopback/loopback_data/"
    error "* buga_recordings_svn_root_path - your buga-recordings path (e.g. /home/buga/buga-recordings/bugatone_space/)"
    error "* buga_recordings_svn_python_path - your buga-recordings/python path (e.g. /home/buga/buga-recordings/bugatone_space/python/)"
    error "* buga_recordings_bin_path - your buga-recording binary output path (e.g. /home/buga/buga-recordings/bugatone_space/bin/linux_x86/)"
    exit 0
else
    echo "Copying bugaconfig.ini..."
    cp Ubuntu-Setup-Scripts/bugaconfig.ini .
    sudo cp Ubuntu-Setup-Scripts/bugaconfig.ini /root
    echo "Copying bugaconfig.ini done"
fi
