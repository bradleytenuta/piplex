# Installing Plex

### Updates the list of available packages and their versions

`sudo apt-get update`

### Actually installs newer versions of the packages

`sudo apt-get upgrade`

### Install Docker

`curl -sSL https://get.docker.com | sh` NOTE - only run this command if docker is not installed.

### Install Docker Compose required libraries

```
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
```

### Install Docker Compose

`sudo pip3 install "docker-compose<1.28"`

`sudo systemctl enable docker`

### Great software to have on Windows to help with SSH onto client.

PUTTY - Great for SSH onto the Rasberry PI.

WinSCP - Great for Using SCP and being able to transfer files from one machine to another.

### Mount Hard Drive

Useful website: https://thepihut.com/blogs/raspberry-pi-tutorials/how-to-mount-an-external-hard-drive-on-the-raspberry-pi-raspian

Check what current storage devices there are:

`blkid`

Checks current drives and partitions:

`fdisk –l`

If the External hard drive is mounted but to the wrong location, then unmount it like so:

`umount <path-to-mounted-folder>`

Mount the external hard drive to the right folder:

`mount /dev/sda1 /mnt`

Make sure the `/mnt` folder has the correct permissions:

`sudo chmod 775 /mnt`

You can check this worked by trying to create a folder in this directory. Now for the mount to occur automatically when booting up. Add the following `/dev/sda1 /mnt ntfs defaults 0 0` to the bottom of this file:

`nano /etc/fstab` 

# Using Plex

### View Plex Server web interface

http://localhost:32400/web

### Updating the Plex Server

Pull the latest image from docker like so:

`sudo docker pull ghcr.io/linuxserver/plex:latest`

Check that the image has been downloaded with the command:

`sudo docker images`

Then follow the commands below to restart the plex server.

### Restarting the Plex Server

First shutdown the container:

`sudo docker-compose -f ~/piplex/docker-compose.yml down`

Then boot it back up again and have it run in the backend.

`sudo docker-compose -f ~/piplex/docker-compose.yml up -d`

### Starting and stopping the plex server without updating it

`sudo docker-compose stop`

`sudo docker-compose start`


### Get shell files to work on the linux machine

Once you've checked out this repository, you'll need to give execute permission
to these shell files as by default, Linux will not let you run them.

The three commands will give the user who owns these files, permission to execute them.
Run these commands below in the current directory. This will recursivly give permissions
to each file in the directory given.

`sudo chmod -R u+x <DIR>`

### Add Static IP Address

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

### Useful commands

If memory of `/dev/root` is 100% then nothing will work. You will need to ssh in and free up some memory.
Command `df -h` shows the total memory used. Command `sudo du -xh / | grep -P "G\t"` shows which folders have used the most memory.

### Other notes

- The command: `id`, gets all users, groups and their identifers.
- Make sure to name the plex server `Bradley-Pi` when starting it.
- Create an SSH key like so
   - Open `~/.ssh` folder.
   - Type command: `ssh-keygen -f ~/.ssh/id_ecdsa -N "" -t ecdsa -b 521`
   - Use default name and no password.
   - Get the info from inside the public key like so: `cat id_ecdsa.pub`.
   - Copy to clipboard and then pase in SSH keys in github settings.
- Issues with space? Check if `/dev/root` is full with command: `df -h`. If it is, you need to free up space.
   - See what is using up all the space: `sudo du -xh / | grep -P "G\t"`
   - Might be due to the very large `/config` file that the plex server creates.


# SSH Info

### Logging into PI and moving files over

You can add a IP address to this file so you dont have to type in the IP everytime: 'C:\Windows\System32\drivers\etc'.

### Logging in

1. Open up powershell and connect to the rasberry PI with the following command: 'ssh <IP_Address> -l pi'

### Copying files over SSH

1. Go to the file that contains the folders of films to copy. Use the following command to copy over files while logged in (-r means recursive):

`scp -r "C:\Users\Bradley\Documents\Dev\piplex\movies_to_copy\Spider-Man 2 (2004)" pi@Bradley-Pi:"'/media/pi/TOSHIBA EXT5/Movies/'"`

# Docker Info

### Upgrade Docker

`sudo apt-get upgrade`

### Uninstall Docker

`sudo apt-get purge docker-ce`

`sudo apt-get purge docker-ce-cli`

`sudo rm -rf /var/lib/docker`

### Update Images

`sudo docker-compose pull`

### See all containers running

`sudo docker ps`

### View logs of the container named 'plex'

`sudo docker logs plex`

### Pull linuxserver Image

This may not be required and so thats why this is not included in the `install.md` file.

`sudo docker pull <imaage-name>:<image-type>`

### Create and Run Docker Compose container

`sudo docker-compose -f ~/piplex/docker-compose.yml up -d`

### Shutdown and remove Docker Compose container

`sudo docker-compose -f ~/piplex/docker-compose.yml down`

### Start Docker-Compose container

`sudo docker-compose start`

### Stop without deleting a Docker-Compose container

`sudo docker-compose stop`