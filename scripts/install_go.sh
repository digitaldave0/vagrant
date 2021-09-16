#!/bin/sh
echo "installing go"
sudo apt install wget tar -y
sudo wget https://golang.org/dl/go1.15.5.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.15.5.linux-amd64.tar.gz
cat >> ~/.bashrc <<EOF
export PATH=$PATH:/usr/local/go/bin
EOF
source ~/.bashrc
go version