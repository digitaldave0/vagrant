#!/bin/sh

FILE=chefworkstation.deb
if [ -f "/tmp/$FILE" ]; then
    echo "$FILE exists will remove."
    rm -f "/tmp/"$FILE
else 
# install chefdk on workstation
sudo apt-get update -y
sudo apt install wget -y
wget https://packages.chef.io/files/stable/chef-workstation/20.11.180/ubuntu/20.04/chef-workstation_20.11.180-1_amd64.deb -O /tmp/$FILE
sudo dpkg -i "/tmp/"$FILE
chef -v
# install vagrant plugin for chef-zero
vagrant plugin install chef-zero
fi