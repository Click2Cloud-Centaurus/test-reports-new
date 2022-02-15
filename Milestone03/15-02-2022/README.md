# Test Report: Centaurus Dashboard Deployment on Arktos Cluster without Mizar CNI (On-Premise)


**Date: 15 Feb 2022**

#### Make sure the following software is installed and added to the $PATH variable:

* Curl 7+
* Git 2.13.2+
* Golang 1.13.9+ ([installation manual](https://golang.org/dl/))
    * Dashboard uses `go mod` for go dependency management, so enable it with running `export GO111MODULE=on`.
* Node.js 12 and npm 6 ([installation with nvm](https://github.com/creationix/nvm#usage))
* Gulp.js 4+ ([installation manual](https://github.com/gulpjs/gulp/blob/master/docs/getting-started/1-quick-start.md))

####  Virtual Machine Configuration:
-  Preferred OS is Ubuntu 18.04. 
- 16 vCPUs, 16 GB RAM, and the Storage size 128GB or more

- **Make sure your cluster is running, run the command from arktos directory. **
```bash
 export KUBECONFIG=/var/run/kubernetes/admin.kubeconfig
./cluster/kubectl.sh get nodes -A
```
- **Output**
```text
NAME               STATUS   ROLES    AGE   VERSION
centaurus-master   Ready    <none>   30m   v0.9.0
```
#### 1. Installing Docker:

```bash
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```
```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```
```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```
- **Install Docker Engine**
```bash
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
```
### 2. Installing Node.js 12 and npm 6:
```bash
sudo apt update
sudo apt -y upgrade
```
```bash
sudo apt update
sudo apt -y install curl dirmngr apt-transport-https lsb-release ca-certificates
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
```
- **Installing Node.js:**
```bash
sudo apt -y install nodejs
sudo apt -y  install gcc g++ make
```
```bash
sudo apt update
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
apt-get install build-essential -y
node -v && npm -v
```
### 3. Install Gulp:
```bash
npm install -g gulp-cli
gulp -v
npm init
npm install --save-dev gulp
```
   ![image](https://user-images.githubusercontent.com/95343388/154060069-e47e613e-3349-44ff-88ce-75b4c4c5c632.png)

### 4. Clone the repository:
```bash
git clone https://github.com/Click2Cloud-Centaurus/dashboard.git $HOME/dashboard -b dev-scale-out
cd $HOME/dashboard
```
### 5. Install the dependencies: (If you are running commands with root privileges set `--unsafe-perm flag`)
```bash
npm ci
```
- **For 'ROOT' user**
```bash
npm ci --unsafe-perm
```
  ![image](https://user-images.githubusercontent.com/95343388/154059882-da6f384a-3799-4b04-a38c-5e3a3292ece0.png)

### 6. If cluster is created using arktos-up script, run following command:
```bash
ln -snf /var/run/kubernetes/admin.kubeconfig $HOME/.kube/config
```
### 7. Deploy postgres container:
```bash
docker run --name postgresql-container -p <db_port>:5432 -e POSTGRES_PASSWORD=<db_password> -d postgres
```
```bash
export POSTGRES_DB=<postgres_db>
export DB_HOST=<host_IP_address>
export DB_PORT=<db_port>
export POSTGRES_USER=<postgres_username>
export POSTGRES_PASSWORD=<password>
```
### 8. Update the .npmrc and angular.json file in the dashboard directory for bind address and port:
```bash
cd $HOME/dashboard
sudo sed -i '/bind_address/s/^/#/g' $HOME/dashboard/.npmrc
sudo sed -i 's/8080/9443/g' $HOME/dashboard/angular.json
sudo sed -i '0,/RANDFILE/{s/RANDFILE/\#&/}' /etc/ssl/openssl.cnf
echo 'kubernetes-dashboard:bind_address = 0.0.0.0 '>> $HOME/dashboard/.npmrc 
```
### 9. To run dashboard:
```bash
npm run start:https --kubernetes-dashboard:kubeconfig=$HOME/.kube/config
```
   ![image](https://user-images.githubusercontent.com/95343388/154059670-3c6e08f8-f85b-40bd-a3d0-302d18102141.png)

- *Leave the terminal running.*
## To access the dashboard:
Dashboard will be accessible on `https://<machine_ip>:9443`
`<machine_ip>`, where `npm` run command is running.

- **Default credentials are as follows:**

* username: `centaurus`

* password: `Centaurus@123`
