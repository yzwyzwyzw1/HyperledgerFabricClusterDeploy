1.配置环境

包括了docker、docker-compose、Go、Hyperledger-fabric环境

2.登录远程主机
```bash
ssh root@45.63.13.222 
```

3.进入远程主机工作目录
```bash
cd /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
```
**后来发现orderer节点不配置go以及fabric环境，也能够启动节点，因此，步骤4、5、6为可选操作，不执行也可以**

4.将本地下载好的go语言安装包上传至远程服务器
```bash
scp ./go1.11.linux-amd64.tar.gz  root@45.63.13.222:/usr/local/src
```
记得将该压缩包解压到该路径下，并重命名：
```bash
tar -zxf go1.11.linux-amd64.tar.gz
```
5.配置环境变量
```bash
vim /etc/profile

export GOROOT="/usr/local/src/go"
export GOPATH="/home/gopath"
export GOBIN=$GOROOT/bin


export PATH=$PATH:$GOROOT:$GOPATH:$GOBIN

source /etc/profile
```
接着可以执行go version命令测试go语言环境是否安装成功。

6.安装Fabric环境
```bash
mkdir -p /home/gopath/src/github.com/hyperledger
cd /home/gopath/src/github.com/hyperledger


git clone https://github.com/hyperledger/fabric.git  
或者 
scp ./fabric-release-1.4.zip  root@45.63.13.222:/home/gopath/src/github.com/hyperledger

进入远程主机的/home/gopath/src/github.com/hyperledger
yum install gcc unzip git
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
7.复制文件到远程工作目录中
```bash
scp ./docker-orderer0.yaml root@45.63.13.222:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures

首先在远程服务器上创建目录:
mkdir -p /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config
mkdir -p /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts

scp -r ../crypto-config/ordererOrganizations root@45.63.13.222:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config
scp ../channel-artifacts/genesis.block root@45.63.13.222:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts

```
8.启动orderer0节点（仅仅测试）
```bash
cd /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures

docker-compose -f docker-orderer0.yaml up -d
```
执行这个命令之后，将会下载latest版本的orderer镜像，通过docker ps 命令可查看，但我需要安装1.4.0的镜像，所以需要从仓库拉去指定版本的orderer镜像。
```bash
docker pull  hyperledger/fabric-orderer:1.4.0
```

其他

关闭节点网络
```bash
docker-compose -f docker-orderer0.yaml down
```
查看容器日志
```bash
docker logs orderer0.example.com
```