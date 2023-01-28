docker pull ghcr.io/linuxserver/plex:latest

docker-compose -f ~/piplex/docker-compose.yml down

docker-compose -f ~/piplex/docker-compose.yml up -d