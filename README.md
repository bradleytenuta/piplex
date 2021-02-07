#### Folders

##### /logs

This folder contains the logs produced by these scripts and cron jobs created by these scripts.

##### /mnt

The word 'mnt' stands for mount. This is where the scripts would mount the provided external hard drives.

#### Get shell files to work on the linux machine.

Once you've checked out this repository, you'll need to give execute permission
to these shell files as by default, Linux will not let you run them.

The three commands will give the user who owns these files, permission to execute them.
Run these commands below in the current directory. This will recursivly give permissions
to each file in the directory given.

sudo chmod -R u+x [DIR]

#### Add Static IP Address

There are two reasons to use a static IP. One is that the IP will be easier to remember.
Second is that it will make sure your Plex server can always be found at the same address.

To get your current IP address, enter the following command.

`hostname -I`

Now open up the `cmdline.txt` file.

`sudo nano /boot/cmdline.txt`

At the bottom of this file, add the following line: (Replacing “`YOUR IP`” with the IP you got from using hostname -I)

`ip=YOUR IP`

Once done, exit by pressing `CTRL + X` and then `Y` to save.

Now simply restart the Pi by running the following command.

`sudo reboot`

#### Plex Commands

-   sudo service plexmediaserver start
-   sudo service plexmediaserver stop
-   sudo service plexmediaserver restart

#### Transfering files over SSH with 'scp'

Below is an example command on how to use scp:

`scp -r <THIS-PC-DIRECTORY>\* <username>@<IP>:<DIRECTORY-TO-DOWNLOAD-TO>`

#### Using a VPN on the Rasberry PI while running Plex Server

In order to get this to work first you will need to follow all 3 guides of this [guide](https://pimylifeup.com/raspberry-pi-surfshark/). 
This guide uses the surfshark VPN. This will require the user to have SurfShark VPN and to create credentials on the SurfShark website.

Once this is done and you have the vpn running on start up. You may need to add a few lines to the vpn .conf file in order for the vpn to ping sites like google.com.
Follow this [link](https://www.raspberrypi.org/forums/viewtopic.php?t=53610) to fix this issue.

Now everything should work, only problem now is its not possible to access the plex server from outside your network due to no VPN port forwarding. A solution might be
to add a port forwarding rule for your router. Add the Private IP of the plex server, use port recommened by plex e.g. `32400`. Use any external port like `11303` and use protocol `UDP`. UDP is much faster than `TCP` when it comes to streaming.

Below are some useful commands to run on the raspberry pi:

- Checks that the OpenVPN is on: `sudo netstat -tlnpu | grep openvpn`.
- Check what the current public IP is: `curl icanhazip.com`.
- This will stop the VPN: `sudo systemctl stop openvpn`.
- This will prevent it from starting on boot: `sudo systemctl disable openvpn`.

#### Updating Plex Server

- In order to update the plex server first turn it off with the following command: `sudo service plexmediaserver stop`.
- Run the following command to download and add the key to the package manager. This key is used to ensure the files that you are downloading are in fact from that repository and signed by that key. `curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -`.
- With the Plex GPG key now added, we can finally add the official plex repository to the sources list by running the following command. `echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list`.
- As we have just added a new repository to our sources, we will need to run the "update" command again to refresh the package list. `sudo apt-get update`.
- The following command updates the current version of the plex media server `sudo apt-get install --only-upgrade plexmediaserver`.
