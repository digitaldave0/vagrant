#!/bin/bash
apt-get -y update

dpkg -s ruby &>/dev/null || {
apt-get -y install ruby
ruby -v
}