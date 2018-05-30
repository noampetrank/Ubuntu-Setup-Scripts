
#### How to install ubuntu 16.04 (can vary between computers):
1. insert DoK with Ubuntu 16.04 installation on it
2. Turn on computer, and press F2/F12/search google (depends on computer)
3. choose what looks like your installation DoK.
   if you get to choose between bios and UEFI, choose UEFI.
4. press Enter
5. installation window 'welcome':
5.1 when asked for password - choose the hard one  
5.2 when asked what to install, check both boxes.  
5.3 connect to wifi  
5.4 when asked details about computer:  
your name - doesn't matter  
computer name - bugaLab__ (number)  
user name - buga  
password - hard one  
5.5 when asked about type of installation - check boxes for 'erase all and install' + 'encrypt disk'(!)  

### Installation
to install execute:
```bash
sudo apt-get install git
git clone https://github.com/Bugatone/Ubuntu-Setup-Scripts.git
cd Ubuntu-Setup-Scripts
sudo ./install.sh
```
#### Stuff to do after installing if needed:  
1. **Read the instructions carefully**  
2. Make sure there are no leftover files as root  
2.1. cd into the home directory (`/home/buga`)  
2.2. Run `ll | grep root`
2.3. There should be no files with root ownership, if there are run `sudo chown -R buga:buga <filename> <filename> <filename>`  
3. Important: Log out and log in to the computer to apply new settings!
3. Make sure you can compile the code via ./make.sh  
3.1. cd into git directory (`~/Bugatone-Space`)  
3.2. run `./make.sh linux`, there is no need for sudo  
4. Using jetbrains toolbox install CLion and PyCharm  
4.1. Download the toolbox from [here](https://www.jetbrains.com/toolbox/app/)  
4.2. **Extract** the downloaded file and run the executable  
4.3. Download PyCharm Professional and CLion, open and activate them (if needed, buy licenses from: https://account.jetbrains.com/login. user name and password are in the 'credentials' file on Drive).
5. Install Android Studio  
5.1. Download version 2.3.3 of android studio from [the archives](https://developer.android.com/studio/archive.html)  
5.2. Extract the downloaded zip to /opt/: from home/buga/Downloads: sudo unzip FILE.zip -d /opt/
5.3. Launch android studio by executing `/opt/android-studio/bin/studio.sh`  
5.4. Let the setup process finish with default values  
5.4. After finishing, on the main window press Configure -> SDK Manager  
5.5. In the first tab (SDK Platforms) select versions 23 & 25  
5.6. In the second tab (SDK Tools) select LLDB  
5.6.1. In that same page press the checkbox at the bottom that says "Show Package Details"  
5.6.2. Now you can install older build tools versions. Install 24.0.1, 25.0.2 and 25.0.3  
5.7. Press OK, accept, and wait for the long download to finish  
5.8. Open BugatoneAudioServerService (`~/Bugatone-Space/projects/android_apps/BugatoneAudioServerService`), and under the tools menu, press the button to create a desktop shortcut for android studio  
5.9. Go to File -> Project Structure and set the Android NDK location to where we downloaded it (`/opt/android-ndk-r11c`)
6. Make sure you can compile BugatoneAudioServerService in android studio  
7. Install ExpressVpn from /mnt/buga_pub/expressvpn_blabla.deb:
Run dpkg -i <file> on all copmuters and see that the command expressvpn works. 
7.1. Register and activate the account with the user name and password in the 'credentials' file on Drive.

#### Stuff to do when new employee is coming:  
- Open new account in Gmail, GitHub (+SSH key), TestRail (if needed), slack, and buy softwares licenses.
