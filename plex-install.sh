# Documentation of these steps can be found here:
# https://pimylifeup.com/raspberry-pi-plex-server/

# Updates the list of available packages and their versions.
sudo apt-get update

# Actually installs newer versions of the packages.
sudo apt-get upgrade

# This package allows the “apt” package manager to retrieve packages over the “https” protocol that the Plex repository uses.
sudo apt-get install apt-transport-https

# To add support for the NTFS file system to our Raspberry Pi
# https://pimylifeup.com/raspberry-pi-ntfs/
sudo apt-get install ntfs-3g

# Let’s now add the Plex repositories to the “apt” package managers key list.
# This key is used to ensure the files that you are downloading are in fact from that repository and signed by that key.
# Run the following command to download and add the key to the package manager.
curl https://downloads.plex.tv/plex-keys/PlexSign.key | sudo apt-key add -

# With the Plex GPG key now added, we can finally add the official plex repository to the sources list by running the following command.
echo deb https://downloads.plex.tv/repo/deb public main | sudo tee /etc/apt/sources.list.d/plexmediaserver.list

# As we have just added a new repository to our sources, we will need to run the “update” command again to refresh the package list.
sudo apt-get update

# Now that we have set up our Raspberry Pi so that it can read from Plex’s 
# official package repositories we can go ahead and finally install the Plex Media server package to the Pi.
# The first is that it creates a user and group for Plex to run under. This user and group is called “plex“.
# It also will set up two directories, one where to store files temporarily that Plex is transcoding. 
# You can find this folder at “/var/lib/plexmediaserver/tmp_transcoding“.
# The second directory is where Plex will store all the metadata it retrieves for your media. 
# This folder can be found at “/var/lib/plexmediaserver/Library/Application Support”
sudo apt install plexmediaserver
