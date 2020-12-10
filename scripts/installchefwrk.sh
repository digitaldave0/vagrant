#!/bin/bash
yum clean all
rm -rf /var/cache/yum
yum update -y
yum install git -y
chef-client -v &>/dev/null || {
curl -L https://www.opscode.com/chef/install.sh | sudo bash
}
cd ~vagrant
git clone https://github.com/opscode/chef-repo.git

[ -d "~vagrant/chef-repo/.chef" ] && echo "Directory ~/chef-repo/.chef exists." || mkdir -p ~vagrant/chef-repo/.chef ]
