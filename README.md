### Installation
Just copy these 3 lines to your terminal and run :)
```bash
sudo apt-get install git && git clone https://github.com/Bugatone/Ubuntu-Setup-Scripts.git setup-scripts && cd setup-scripts && ./install.sh
```

Stuff to do after installing if needed:  
1. Make sure you can compile the code via ./make.sh  
1.1. cd into git directory (`~/Bugatone-Space`)  
1.2. run `./make.sh linux`, there is no need for sudo  
2. Using jetbrains toolbox install CLion and PyCharm  
2.1. Download the toolbox from [here](https://www.jetbrains.com/toolbox/app/)  
2.2. Download the latest version of PyCharm Professional and CLion  
3. Install Android Studio  
3.1. Version 2.1.2 that is installed on most of the computers isn't available to download anymore, download the latest version available and be aware that you aren't checking in your modified build.gradle files  
3.2. You should install it into /opt/  
4. Install ndk  
4.1. Must be ndk [version 11c](https://developer.android.com/ndk/downloads/older_releases.html)  
4.2. Install it to /opt as well
5. Install android sdk via studio in all the required version (Build tool 24, api level 23, plus the latest version of adb)  
5.1. Open android studio, under tools you will have SDK MAnager, use it to select all the api versions needed
6. Make sure you can compile BugatoneAudioServerService in android studio  
7. run `sudo crontab -e` and change the line `* * * * * touch /mnt/buga_storage/` to `* * * * * touch /mnt/buga_storage/"YourComputerName"`. This fixes a bug in the script
