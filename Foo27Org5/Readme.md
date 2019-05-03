1.配置环境

包括了docker、docker-compose环境

2.登录远程主机
```bash
ssh root@45.77.99.221
```
3.进入远程主机工作目录
```bash
cd /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
```

4.复制文件到远程工作目录中
```bash
首先在远程服务器上创建目录:
mkdir -p /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config/peerOrganizations
mkdir -p /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts
mkdir -p /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/chaincode

scp -r ../crypto-config/peerOrganizations/org5.example.com root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config/peerOrganizations
scp ../channel-artifacts/mychannel.tx root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts

scp ../channel-artifacts/Org5MSPanchors.tx root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts


scp -r ../crypto-config/ordererOrganizations root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config/

记得首先修改docker-peerfoo27org5.yaml中ca容器的--ca.keyfile的值为真实的org5.example.com的私钥
scp ./docker-peerfoo27org5.yaml root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
```
5.启动foo27org5节点（仅仅测试）
```bash
cd /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures

docker-compose -f docker-peerfoo27org5.yaml up -d
```
执行这个命令之后，将会下载latest版本的peer镜像，通过docker ps 命令可查看，但我需要安装1.4.0的镜像，所以需要从仓库拉去指定版本的peer镜像。
```bash
docker pull  hyperledger/fabric-peer:1.4.0
```

关闭foo27org5节点(配置fabric环境之前要关闭网络，否则，make release会失败)
```bash
docker-compose -f docker-peerfoo27org5.yaml down
```
**Peer节点需要安装链码，以及执行一些其他操作，最好安装go及Fabric环境**

6.将本地下载好的go语言安装包上传至远程服务器
```bash
scp ./go1.11.linux-amd64.tar.gz  root@45.77.99.221:/usr/local/src
```
记得将该压缩包解压到该路径下，并重命名：
```bash
tar -zxf go1.11.linux-amd64.tar.gz
```
7.配置环境变量
```bash
vim /etc/profile

export GOROOT="/usr/local/src/go"
export GOPATH="/home/gopath"
export GOBIN=$GOROOT/bin


export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN

source /etc/profile
```
接着可以执行go version命令测试go语言环境是否安装成功。

8.安装Fabric环境
```bash
mkdir -p /home/gopath/src/github.com/hyperledger
cd /home/gopath/src/github.com/hyperledger


git clone https://github.com/hyperledger/fabric.git  
或者 
scp ./fabric-release-1.4.zip  root@45.77.99.221:/home/gopath/src/github.com/hyperledger

进入远程主机的/home/gopath/src/github.com/hyperledger
yum install gcc unzip git vim
unzip fabric-release-1.4.zip
mv fabric-release-1.4 fabric

cd fabric
make release

cd release/linux-amd64/bin
ls
pwd

配置环境变量
vim /etc/profile
export FABRIC_BIN="/home/gopath/src/github.com/hyperledger/fabric/release/linux-amd64/bin"
export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN:$FABRIC_BIN
source /etc/profile
```

9.上传链码至远程服务器
```bash
在本地上传文件至远程服务器
scp ../chaincode/chaincode_example02.go root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/chaincode
```