#!/bin/bash
sudo apt update -y
sudo apt upgrade -y
sudo apt install openjdk-11-jdk-headless -y
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
/etc/apt/sources.list.d/jenkins.list'
sudo apt-get update
sudo apt install jenkins -y
sudo systemctl status jenkins
sudo systemctl start jenkins
sudo systemctl enable --now jenkins
sudo ufw allow 8080/tcp
sudo ufw reload
sudo ufw status
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
