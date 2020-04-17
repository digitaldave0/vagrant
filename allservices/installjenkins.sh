#!/bin/bash
sudo apt-get update -y
apt -y install openjdk-8-jdk

dpkg -s jenkins &>/dev/null || {
wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add -
echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list
apt-get update -y
apt -y install jenkins
service jenkins start
}
curl http://localhost:8080
cat /var/lib/jenkins/secrets/initialAdminPassword