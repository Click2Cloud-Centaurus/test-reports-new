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
     
  •	Once bootstrap is completed, you can then compile Mizar. Make sure to run these in sudo mode:
  
     cd ~/mizar
     sudo su
     
  • Install grpcio tools:
  
      python3 -m pip install --user grpcio-tools
      make
  
  • Build arktos-network-controller (as it is not part of arktos-up.sh yet)
     
      cd $HOME/go/src/k8s.io/arktos
      sudo ./hack/setup-dev-node.sh
      make all WHAT=cmd/arktos-network-controller
      
  • Also, please ensure the hostname and its ip address in /etc/hosts. 
  
  • Replace the Arktos containerd:
  
      cd $HOME/mizar
      sudo bash replace-containerd.sh
      
  • Before deploying Mizar, you will need first start up Arktos API server:
    
      cd $HOME/go/src/k8s.io/arktos
      ./hack/arktos-up.sh
      
  • Deploy Mizar. Open a new terminal window, and run:
    
      cd $HOME/mizar
      ./deploy-mizar.sh
      
   • Once your arktos server and Mizar are running. To verify, you can open a new terminal and run kubectl get nodes, you should see a node running with the name starts with "IP" followed by the private IP address of your lab machine.
   
      kubectl get nodes -Ao wide
   
   #### You also want make sure the default kubernetes bridge network configuration file is deleted:
     
       sudo ls /etc/cni/net.d
       sudo rm /etc/cni/net.d/bridge.conf

   • Start Arktos network controller. From a new terminal window, run:
   
        cd $HOME/go/src/k8s.io/arktos
        ./_output/local/bin/linux/amd64/arktos-network-controller --kubeconfig=/var/run/kubernetes/admin.kubeconfig --kube-apiserver-ip=xxx.xxx.xxx.xxx
        
   #### where the kube-apiserver-ip is your lab machine's private ip address
   
   • Open another terminal:
         
   • Deploy test pods:
        
          kubectl apply -f https://raw.githubusercontent.com/Click2Cloud-Centaurus/Documentation/main/test-yamls/test_pods.yaml
          kubectl get pods -Ao wide
          
   ### Pods are getting stuck in ContainerCreating state      
          
   ![image](https://user-images.githubusercontent.com/95343388/149309907-5acc2688-bac8-47c6-8e52-fef5ee7f49c0.png)

          
  





  




     
  
