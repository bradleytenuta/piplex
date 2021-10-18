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

`sudo docker pull linuxserver/plex:arm64v8-latest`

### Create and Run Docker Compose container

`sudo docker-compose -f ~/piplex/docker-compose.yml up -d`

### Shutdown and remove Docker Compose container

`sudo docker-compose -f ~/piplex/docker-compose.yml down`

### Start Docker-Compose container

`sudo docker-compose start`

### Stop without deleting a Docker-Compose container

`sudo docker-compose stop`
