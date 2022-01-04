#! /bin/bash

set -x

hostnamectl set-hostname arktos-test
echo '192.168.1.210 arktos-test' | sudo tee -a /etc/hosts
init 6

Done
