# Below is the cron jobs to add to the root crontab file, not the bradleytenuta user.
# open the crontab and edit it to add this cron job with the command: 'sudo crontab -e'
# Note 'sudo crontab -e', gives a different crontab to 'crontab -e'.
#
# The first cron job will run this script once a day at midnight.
# The second cron job will run this script on start up.
#
# 0 0 * * * sudo /home/bradleytenuta/piplex/plex-run-cron.sh >> /home/bradleytenuta/piplex/logs/plex-run-cron.txt 2>&1
# @reboot sudo /home/bradleytenuta/piplex/plex-run-cron.sh >> /home/bradleytenuta/piplex/logs/plex-run-cron.txt 2>&1
#

# Mounts the external hard drive to the mnt folder.
mount -o uid=bradleytenuta,gid=plexgroup /dev/sda1 /home/bradleytenuta/piplex/mnt/ext_1