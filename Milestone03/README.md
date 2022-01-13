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
  
  •	Log onto your lab machine, then run bootstrap.sh script from the Mizar project folder to bootstrap your lab machine.
  
    
     cd ~/mizar
     sudo bootstrap.sh
     
  •	Once bootstrap is completed, you can then compile Mizar. Make sure to run these in sudo mode
     
  
