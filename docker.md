### Upgrade Docker

`sudo apt-get upgrade`

### Uninstall Docker

`sudo apt-get purge docker-ce`

`sudo apt-get purge docker-ce-cli`

`sudo rm -rf /var/lib/docker`

### Update Images

`docker-compose pull`

### See all containers running

`docker ps`

### View logs of the container named 'plex'

`docker logs plex`

### Pull linuxserver Image

This may not be required and so thats why this is not included in the `install.md` file.

`docker pull linuxserver/plex:arm64v8-latest`
