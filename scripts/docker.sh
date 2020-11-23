#!/bin/sh

# remove older versions if needed and add repo
sudo apt-get update
sudo apt remove docker docker-engine docker.io containerd runc -y
sudo apt install apt-transport-https ca-certificates -y
sudo apt install curl gnupg-agent software-properties-common gnupg -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update

#install docker 

sudo apt install docker-ce docker-ce-cli containerd.io -y
sudo systemctl status docker
sudo docker run hello-world
sudo docker -v
sudo usermod -aG docker vagrant

#install compose

sudo curl -SsL "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
docker-compose --version
