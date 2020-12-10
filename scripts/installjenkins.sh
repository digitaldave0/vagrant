#!/bin/bash
sudo apt-get update -y
apt -y install openjdk-8-jdk
apt -y install wget

dpkg -s jenkins &>/dev/null || {
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
apt-get update -y
apt -y install jenkins
sudo systemctl status jenkins.service
}
curl http://localhost:8080
cat /var/lib/jenkins/secrets/initialAdminPassword