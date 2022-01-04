#! /bin/bash

set -x

hostnamectl set-hostname arktos-test
echo '192.168.1.210 arktos-test' | sudo tee -a /etc/hosts
wget https://raw.githubusercontent.com/CentaurusInfra/mizar/dev-next/kernelupdate.sh
sudo bash kernelupdate.sh	-y
init 6

Done
