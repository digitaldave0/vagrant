#! /bin/bash
VERSION="1.0.0"
sudo apt update 
sudo apt install curl git -y
sudo git clone https://github.com/aws-cloudformation/cloudformation-guard.git
sudo wget  https://github.com/aws-cloudformation/cloudformation-guard/releases/download/$VERSION/cfn-guard-linux-$VERSION.tar.gz
tar -xvf cfn-guard-linux-$VERSION.tar.gz
cd  ./cfn-guard-linux
./cfn-guard --version
#../cfn-guard-linux/cfn-guard rulegen ../cloudformation-guard/templates/ec2-cloudformation.yaml 2>&1 | sudo tee ../cloudformation-guard/rules/ec2-cloudformation.ruleset

