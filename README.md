# Vagrant

> A List of useful project templates

## Install Vagrant

'''bash
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
'''

## Setup Autocompletion

Vagrant provides the ability to autocomplete commands. Currently, the bash and zsh shells are supported. These can be enabled by running vagrant autocomplete install --bash --zsh.

## CLI Ref

https://developer.hashicorp.com/vagrant/docs/cli
