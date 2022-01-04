#! /bin/bash

set -x

hostnamectl set-hostname arktos-test
echo '$i arktos-test' | sudo tee -a /etc/hosts
wget https://raw.githubusercontent.com/CentaurusInfra/mizar/dev-next/kernelupdate.sh
yes y | sudo bash kernelupdate.sh	-y
init 6

Done
