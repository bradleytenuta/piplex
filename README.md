#### Get shell files to work on the linux machine.

Once you've checked out this repository, you'll need to give execute permission
to these shell files as by default, Linux will not let you run them.

The three commands will give the user who owns these files, permission to execute them.
Run these commands below in the current directory.

chmod u+x plex-install.sh
chmod u+x plex-run-cron.sh
chmod u+x plex-update.sh

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
