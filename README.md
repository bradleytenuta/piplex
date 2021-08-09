### View Plex Server web interface

http://localhost:32400/web

### Permissions

The command: `id`, gets all users, groups and their identifers.

### Other notes

Make sure to name the plex server `Bradley-Pi` when starting it.

#### Get shell files to work on the linux machine

Once you've checked out this repository, you'll need to give execute permission
to these shell files as by default, Linux will not let you run them.

The three commands will give the user who owns these files, permission to execute them.
Run these commands below in the current directory. This will recursivly give permissions
to each file in the directory given.

sudo chmod -R u+x [DIR]

#### Add Static IP Address

There are two reasons to use a static IP. One is that the IP will be easier to remember.
Second is that it will make sure your Plex server can always be found at the same address.

To get your current IP address, enter the following command (Its the first IP in the list.).

`hostname -I`

Now open up the `cmdline.txt` file.

`sudo nano /boot/cmdline.txt`

At the bottom of this file, add the following line: (Replacing “`YOUR IP`” with the IP you got from using `hostname -I`)

`ip=YOUR IP`

Once done, exit by pressing `CTRL + X` and then `Y` to save.

Now simply restart the Pi by running the following command.

`sudo reboot`

### How to allow remote access for Plex

1. Open up your router. Usually it starts like: `192.168.0.1`. 
Go to port forwarding and create a new rule.
2. Use the IP address for the plex server and place in the ports you want to use.
3. Create rule, then open up the plex web UI and turn on remote access, should be good to go now.
