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

`sudo pip3 install docker-compose`

`sudo systemctl enable docker`
