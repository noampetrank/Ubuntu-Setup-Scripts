### Installation
Just copy these 3 lines to your terminal and run :)
```bash
sudo apt-get install git && git clone https://github.com/Bugatone/Ubuntu-Setup-Scripts.git setup-scripts && cd setup-scripts && sudo ./install.sh
```

Stuff to do after installing if needed:  
1. **Read the instructions carefully**  
2. Make sure there are no leftover files as root  
2.1. cd into the home directory (`/home/buga`)  
2.2. Run `ll | grep root`
2.3. There should be no files with root ownership, if there are run `sudo chown -R buga:buga <filename> <filename> <filename>`  
3. Important: Log out and log in to the computer to apply new settings
3. Make sure you can compile the code via ./make.sh  
3.1. cd into git directory (`~/Bugatone-Space`)  
3.2. run `./make.sh linux`, there is no need for sudo  
4. Using jetbrains toolbox install CLion and PyCharm  
4.1. Download the toolbox from [here](https://www.jetbrains.com/toolbox/app/)  
4.2. Extract the downloaded file and run the executable  
4.3. Download PyCharm Professional and CLion  
5. Install Android Studio  
5.1. Download version 2.3.3 of android studio from [the archives](https://developer.android.com/studio/archive.html)  
5.2. Extract the downloaded zip to /opt/  
5.3. Launch android studio by executing `/opt/android-studio/bin/studio.sh`  
5.4. Let the setup process finish with default values  
5.4. After finishing, on the main window press Configure -> SDK Manager  
5.5. In the first tab (SDK Platforms) select versions 23, 24, & 25  
5.6. In the second tab (SDK Tools) select NDK and LLDB  
5.6.1. In that same page press the checkbox at the bottom that says "Show Package Details"  
5.6.2. Now you can install older build tools versions. Install 24.0.1 and 25.0.3  
5.7. Press OK, accept, and wait for the long download to finish  
5.8. Open any project, and under the tools menu, press the button to create a desktop shortcut for android studio  
6. Install ndk [version 11c](https://developer.android.com/ndk/downloads/older_releases.html)  
6.1. Download the zip from the link  
6.2. Unzip to /opt  
6.3. Make sure you can compile to android (`./make.sh android`)  
7. Make sure you can compile BugatoneAudioServerService in android studio  
8. run `sudo crontab -e` and change the line `* * * * * touch /mnt/buga_storage/network_workaround/` to `* * * * * touch /mnt/buga_storage/network_workaround/"YourComputerName"`. This fixes a bug in the script
