### Permissions

Make sure the below permissions are used for the docker-compose configuration.

`uid=bradleytenuta`

`gid=plexgroup`

The command: `id username`, gets username and group ids if it is a part of the user.

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

To get your current IP address, enter the following command.

`hostname -I`

Now open up the `cmdline.txt` file.

`sudo nano /boot/cmdline.txt`

At the bottom of this file, add the following line: (Replacing “`YOUR IP`” with the IP you got from using `hostname -I`)

`ip=YOUR IP`

Once done, exit by pressing `CTRL + X` and then `Y` to save.

Now simply restart the Pi by running the following command.

`sudo reboot`

#### Useful commands

If memory of `/dev/root` is 100% then nothing will work. You will need to ssh in and free up some memory.
Command `df -h` shows the total memory used. Command `sudo du -xh / | grep -P "G\t"` shows which folders have used the most memory.
