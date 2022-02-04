# Cloud Intel Deployment On Single VM


### Abstract

The purpose of this document is to setup and configure the Cloud Intel on single virtual machine. Cloud Intel is an assessment tool that identifies your IT inventory and evaluates it to make you decide the movement of your workloads to Cloud.

### Virtual Machine Configuration


•        ` Centos 7 `
•        ` 8 vCPUs, 16 GB RAM and 200 GB Storage `

### Installing Docker:

    sudo yum install -y yum-utils
    sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
    sudo yum install docker-ce docker-ce-cli containerd.io
    sudo systemctl start docker
    sudo systemctl enable docker
    
    
### Installing Docker Compose:


     sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
     sudo chmod +x /usr/local/bin/docker-compose
     docker-compose --version







