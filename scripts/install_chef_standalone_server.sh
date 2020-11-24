#!/bin/sh
USER_NAME="dave"
FIRST_NAME="me"
LAST_NAME="me"
EMAIL="me@me.com"
FILE="chefserver.deb"
ORG=mylab
FULL_ORG="Its My Lab"
if [ -f "/tmp/$FILE" ]; then
    echo "$FILE exists will remove."
    rm -f "/tmp/"$FILE
else 
# install standalone infra server
sudo apt-get update -y
sudo apt install wget -y
wget https://packages.chef.io/files/stable/chef-server/14.0.65/ubuntu/18.04/chef-server-core_14.0.65-1_amd64.deb -O /tmp/$FILE
sudo dpkg -i "/tmp/"$FILE
sudo chef-server-ctl reconfigure  --chef-license=accept
# create admin
sudo chef-server-ctl user-create $USER_NAME $FIRST_NAME $LAST_NAME $EMAIL 'notsecure$yet' --file "/tmp/"$USER_NAME
# create organization
sudo chef-server-ctl org-create $ORG 'Its My lab' --association_user $USER_NAME --filename "/tmp/$ORG.pem
fi