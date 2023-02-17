#!/bin/bash
sudo apt-get update -y
sudo apt-get install ca-certificates curl gnupg -y
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt install openjdk-11-jdk-headless -y
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
/etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo docker run hello-world
sudo groupadd docker
sudo usermod -aG docker $USER
sudo apt install jenkins -y
sudo systemctl status jenkins
sudo systemctl start jenkins
sudo systemctl enable --now jenkins
sudo ufw allow 8080/tcp
sudo ufw reload
sudo ufw status
sudo cat /var/lib/jenkins/secrets/initialAdminPassword