# Below this line is the command for creating a cron job. This cron just will execute this file.
# The logs of this crobjob will be stored in the logs folder of this directory.
#
# sudo crontab * * * * * /home/bradleytenuta/piplex/plex-run-cron.sh >> /home/bradleytenuta/piplex/logs/plex-run-cron.log 2>&1
#
#

# Mounts the external hard drive to the mnt folder.
sudo mount -o uid=bradleytenuta,gid=plexgroup /dev/sda1 /home/bradleytenuta/mnt/ext_1