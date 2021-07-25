## Run Plex Container

Gets the latest version of the plex server, use once when first downloading.

`docker pull linuxserver/plex:arm64v8-latest`

### Start and shutdown the plex server.

To run the docker container: `docker-compose -f ~/piplex/docker-compose.yml up -d`.

To shutdown the docker container `docker-compose -f ~/piplex/docker-compose.yml down`.

## Install Docker

`sudo apt-get update && sudo apt-get upgrade`

`curl -sSL https://get.docker.com | sh`

## Install Docker Compose

```
sudo apt-get install libffi-dev libssl-dev
sudo apt install python3-dev
sudo apt-get install -y python3 python3-pip
```

`sudo pip3 install docker-compose`

`sudo systemctl enable docker`

## Upgrade Docker

`sudo apt-get upgrade`

## Uninstall Docker

`sudo apt-get purge docker-ce`

`sudo apt-get purge docker-ce-cli`

`sudo rm -rf /var/lib/docker`

## Permissions

`uid=bradleytenuta`

`gid=plexgroup`
