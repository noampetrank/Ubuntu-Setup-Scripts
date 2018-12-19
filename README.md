
#### How to install ubuntu 16.04 (can vary between computers):
1. Insert DoK with Ubuntu 16.04 installation on it  
2. Turn on computer, and press F2/F12/search google (depends on computer)  
3. Choose what looks like your installation DoK.  
   if you get to choose between bios and UEFI, choose UEFI.  
4. Press Enter  
5. Installation window 'welcome':  
5.1. When asked for password - choose the hard one  
5.2. When asked what to install, check both boxes.  
5.3. Connect to wifi  
5.4. When asked details about computer:  
your name - doesn't matter  
computer name - bugalab\_ (number)  
user name - buga  
password - hard one  
5.5. When asked about type of installation - check boxes for 'erase all and install' + 'encrypt disk'(!)  

### Installation
To install execute:  

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
3. **Important**: Log out and log in to the computer to apply new settings!  
4. Make sure you can compile the code via `./make.sh`  
4.1. cd into git directory (`~/Bugatone-Space`)  
4.2. run `./make.sh linux`, there is no need for sudo  
5. Using jetbrains toolbox install CLion and PyCharm  
5.1. Download the toolbox from [here](https://www.jetbrains.com/toolbox/app/)  
5.2. **Extract** the downloaded file and run the executable  
5.3. Download PyCharm Professional and CLion, open and activate them (if needed, buy licenses from: https://account.jetbrains.com/login. user name and password are in the 'credentials' file on Drive).  
5.4 Go to https://account.jetbrains.com/login and sign in with adminstrator user.  
5.5 Go to Bugatone licences. click on the softaware and check the box next to the user. click on manage -> Request 1 activation code. paste that code in the activation code field in the software.  
6. Setup Android Studio  
6.1. Open android studio by executing `/opt/android-studio/bin/studio.sh`  
6.2. Let the setup process finish with default values  
6.3. After finishing, on the main window press Configure -> SDK Manager  
6.4. In the first tab (SDK Platforms)  
6.4.1. Press the checkbox at the bottom that says "Show Package Details"  
6.4.2. Select Android SDK Platform 28, 26, 25, 23  
6.4.3. Select Sources for Android 25  
6.5. In the second tab (SDK Tools)  
6.5.1. Select CMake, LLDB, Android Emulator, Android SDK Platform-Tools, Android SDK Tools, NDK, Support Repository with all its sub-nodes  
6.5.2. Press the checkbox at the bottom that says "Show Package Details"  
6.5.3. Select Android SDK Build-Tools 24.0.1, 25.0.3, 26.0.2, 27.0.3, 28.0.3  
6.6. Press OK, accept, and wait for the long download to finish  
6.7. Build BugaRpcSoLoader  
6.7.1. Go to File -> Open -> `~/device_communication/android/BugaRpcSoLoader`  
6.7.2. Wait for sync to finish. If Android Studio requests to install something, do it.  
6.7.3. Go to File -> Sync Project with Gradle Files. Make sure the process finishes without errors.  
6.7.4. Make sure you can compile the project in Android Studio - click on the green hammer.  
6.8. Build smart_ep_demo  
6.8.1. Go to File -> Open -> `~/mobileproduct/android_apps/smart_ep_demo`  
6.8.2. Wait for sync to finish. If Android Studio requests to install something, do it.  
6.8.3. Go to File -> Sync Project with Gradle Files. Make sure the process finishes without errors.  
6.8.4. Make sure you can compile the project in Android Studio - click on the green hammer.  
7. Make sure you can export a version `./make.py android -x some_directory` from `~/mobileproduct/` directory.  
8. Open CLion and update the compiler settings to be as following:  


![CLion Screenshot](https://github.com/Bugatone/Ubuntu-Setup-Scripts/blob/master/Images/ClionClang.png?raw=true)


9. Install ExpressVpn: Copy /mnt/buga\_pub/expressvpn\_blabla.deb to home/buga/Downloads.  
9.1. From home/buga/Downloads run: sudo dpkg -i <file>  
9.2 In terminal, type: expressvpn to make sure it was installed  
9.3. Register and activate the account with the user name and password in the 'credentials' file on Drive.  

#### Stuff to do when new employee is coming:
- Open new account in Gmail, GitHub (+SSH key), TestRail (if needed), Trello, and buy softwares licenses.  

#### SSH Keys for GitHub:
1. https://jdblischak.github.io/2014-09-18-chicago/novice/git/05-sshkeys.html  
2. Switching remote URLs from HTTPS to SSH:  
Go to all repositories and change from https to shh:  

```
git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
```

2.1 Verify that the remote URL has changed:  

`git remote -v`  

#### Shared Printer (Google Cloud Print):
Send files to: `8634uvi37olt@hpeprint.com`  
Alternatively, message the HP Printer Facebook bot.  
