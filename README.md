
#### How to install ubuntu 18.04
1. Insert DoK with Ubuntu 18.04 installation on it  
2. Turn on computer, and press F2/F12/F8/delete
3. Choose what looks like your installation DoK.  
   if you get to choose between bios and UEFI, choose UEFI.  
4. Press Enter  
5. Installation window 'welcome':  
5.1. When asked for password - choose the hard one for laptops and regular for desktops  
5.2. When asked about type of installation - check boxes for 'erase all and install' + 'encrypt disk'(!)   
5.3. Connect to wifi  
5.4. When asked details about computer:  
__your name__ - Name of the  persong using the computer  
__computer name__ - buga<Username> (eg. BugaZiv, BugaEinat)
__user name__ - buga  
__password__ - hard one  
  

### Installation
To install execute:  

```bash
sudo apt-get install git
git clone https://github.com/Bugatone/Ubuntu-Setup-Scripts.git
cd Ubuntu-Setup-Scripts
sudo ./install.sh
```

#### Stuff you can do during the installation
1. Download [jetbrains toolbox](https://www.jetbrains.com/toolbox/app/)  
2. Download PyCharm, CLion and Android Studio  
3. When mobileproduct has completed cloning (meaning there is a folder in `~/mobileproduct`) you can do the following:  
3.0. Run `sudo chown -R buga:buga /home/buga`  
3.1. Launch android studio, approve all the installations  
3.2. Open the project at `mobileproduct/android_apps/BugatoneAuthDemo`  
3.3. Press all buttons until the project agrees to load  
3.3.1 This should include install adnroid sdk 28 and approving the license  

#### Stuff to do after installing:  
1. **Read the instructions carefully**  
2. **Important**: Restart the computer once. Do not skip this step
3. Make sure you can compile the code:
```
$ cd ~/Bugatone-Space
$ ./make.sh linux
$ cd ~/mobileproduct
$ ./make.py
```
4. Make sure you can export a version.   
4.1. `cd ~/mobileproduct`  
4.2. `mkdir some_directory`  
4.3. `./make.py -x some_directory --name "some name"`  
4.4. You don't have to wait for the end of the benchmark, that takes hours.  
5. Open CLion and update the compiler settings to be as following:  
  
  
![CLion Screenshot](https://github.com/Bugatone/Ubuntu-Setup-Scripts/blob/master/Images/ClionClang.png?raw=true)  
  
For laptops only:   
6. Install ExpressVpn:  
6.1. `cp /mnt/buga_pub/expressvpn_blabla.deb /home/buga/Downloads`  
6.2. `cd /home/buga/Downloads && sudo dpkg -i expressvpn_blabla.deb`  
6.3. In terminal, type `expressvpn` to make sure it was installed  
6.4. Register and activate the account with the user name and password in the 'credentials' file on Drive.  

#### Stuff to do when new employee is coming:
- Open new account in Gmail, GitHub (+SSH key), TestRail (if needed), Trello, and buy softwares licenses.  

#### SSH Keys for GitHub:
1. https://jdblischak.github.io/2014-09-18-chicago/novice/git/05-sshkeys.html  
2. Switching remote URLs from HTTPS to SSH:  
Go to all repositories and change from https to shh:  

```
git remote set-url origin git@github.com:Bugatone/REPOSITORY.git
```

2.1 Verify that the remote URL has changed:  

`git remote -v`  

#### Shared Printer (Google Cloud Print):
Send files to: `8634uvi37olt@hpeprint.com`  
Alternatively, message the HP Printer Facebook bot.  
