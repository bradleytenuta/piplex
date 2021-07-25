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

#### Logging into PI and moving files over.

You can add a IP address to this file so you dont have to type in the IP everytime: 'C:\Windows\System32\drivers\etc\hosts'.

##### Logging in

1. Open up powershell and connect to the rasberry PI with the following command: 'ssh <IP_Address> -l bradleytenuta'

##### Copying files over SSH

1. Go to the file that contains the folders of films to copy. Use the following command to copy over files while logged in: 'scp -r \* bradleytenuta@Bradley-Pi:~/piplex/mnt/ext_1/Movies/'

-   -r means recursive