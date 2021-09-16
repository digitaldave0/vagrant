#!/bin/sh
#install transmission serverless.
sudo apt-get install software-properties-common -y
sudo apt update
sudo add-apt-repository ppa:transmissionbt/ppa -y
sudo apt-get install transmission-cli transmission-common transmission-daemon -y
cd ~
mkdir -p ~/Downloads/transmission/{completed,incomplete}
sudo usermod -a -G debian-transmission $USER
sudo chgrp -R debian-transmission ~/Downloads/transmission
sudo chmod -R 775 ~/Downloads/transmission
cd /etc/transmission-daemon
sudo cp -a settings.json settings.json.default
mkdir ~/.config/
mkdir -p ~/.config/transmission-daemon/
sudo cp -a /etc/transmission-daemon/settings.json 
sudo echo -e "rpc-whitelist": "127.0.0.1,192.168.*.*","" >> sudo echo -e "rpc-whitelist": "127.0.0.1,192.168.*.*","" >> ~/.config/transmission-daemon/settings.json 
sudo chgrp -R debian-transmission ~/.config/transmission-daemon
sudo chmod -R 770 ~/.config/transmission-daemon
sudo service transmission-daemon start
sudo service transmission-daemon reload
sudo service transmission-daemon status