# Test report - Deployment of Arktos Cluster Without Mizar CNI (On-Premise) 

### This document captures the steps to deploy an Arktos cluster lab without Mizar CNI. The machine in this lab used are 16 GB RAM, 8 vCPUs, 128 GB storage and Ubuntu 18.04 LTS. 

#### Date-24 Jan 2021 

### 1) Update The Kernel (If required):
#### To check kernel, run following command
     uname -a            
     wget https://raw.githubusercontent.com/CentaurusInfra/mizar/dev-next/kernelupdate.sh
     sudo bash kernelupdate.sh
     
### 2) Install Dependencies:
#### Run the following steps to install dependencies required for arktos deployment:    
     sudo mkdir -p $GOPATH/src/github.com  
     cd $GOPATH/src/github.com  
     sudo git clone https://github.com/CentaurusInfra/arktos  
     cd arktos  
     sudo bash hack/setup-dev-node.sh 
     cd $GOPATH/src/github.com/arktos  
     export PATH=$PATH:/usr/local/go/bin
     make  

### 3) Run Arktos:
#### The easiest way to run Arktos is to bring up a single-node cluster in your local development box:
     hack/arktos-up.sh   
     
#### Output:

![image](https://user-images.githubusercontent.com/95343388/150755619-528e174a-f644-4a6a-b642-4837bf1f2e4f.png)

### 4) Now Open Another Terminal And Check The Nodes Status:
      ./cluster/kubectl.sh get nodes 
      
![image](https://user-images.githubusercontent.com/95343388/150756108-feb95fce-1593-4119-a822-f914728cd28b.png)

      
### 5) Deploy Test Pods & Verify the Pods:
      ./cluster/kubectl.sh  apply -f   https://raw.githubusercontent.com/Click2Cloud-Centaurus/Documentation/main/test-yamls/test_pods.yaml
      ./cluster/kubectl.sh get pods -Ao wide
      
#### Output:
      
![image](https://user-images.githubusercontent.com/95343388/150756631-2e86552d-36a2-4a34-a90f-2d28d58a70d3.png)

### 6) Verify the health criteria of the pods:
       ./cluster/kubectl.sh exec -it netpod1 ping 10.88.0.5  
       ./cluster/kubectl.sh exec -it netpod2 ping 10.88.0.6
       
![image](https://user-images.githubusercontent.com/95343388/150756937-062de211-2332-446e-a3d2-b0bf3b2aca94.png)

## Deployment PASSED !


      
      


