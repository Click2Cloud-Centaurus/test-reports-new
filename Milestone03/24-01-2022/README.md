# Test report - Deployment of Arktos Cluster Without Mizar CNI (On-Premise) 

### This document captures the steps to deploy an Arktos cluster lab without Mizar CNI. The machine in this lab used are 16 GB RAM, 8 vCPUs, 128 GB storage and Ubuntu 18.04 LTS. 
#### Date-24 Jan 2021 
### 1) Update The Kernel (If required):
To check kernel, run following command
     uname -a            
     wget https://raw.githubusercontent.com/CentaurusInfra/mizar/dev-next/kernelupdate.sh
     sudo bash kernelupdate.sh	         

