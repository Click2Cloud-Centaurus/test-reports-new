# Arktos and Mizar Single Node Installation Guide (On-Prem)
### Introduction
#### This document is intended for new users to install the Arktos platform with Mizar as the underlying network technology.
### Installation Steps
  • Prepare lab machine, the preferred OS is Ubuntu 18.04. The recommended instance size is 16 vCPUs, 16 GB RAM, and the storage size is 128GB or more
  
     cd
     git clone https://github.com/CentaurusInfra/mizar.git
     cd mizar
     chmod 755 setup-machine-arktos.sh
     ./setup-machine-arktos.sh
     
  • The lab machine will be rebooted once the above script is completed, you will be automatically logged out of the lab machine.
