#!/bin/bash
apt-get -y update

dpkg -s python3 &>/dev/null || {
apt-get -y install python3
python3 -V
}