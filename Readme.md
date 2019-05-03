# 简介

Kafka是一个分布式消息系统，在Fabric网络体系中是一种启动Fabric网络的模式或类型。

Zookeeper是一种分布式系统中被广泛用来作为分布式状态管理、分布式协调管理、分布式配置管理和分布式锁服务的集群。Kafka增加和减少服务器都会在Zookeeper节点上触发相应的事件，Kafka系统会捕获这些事件，进行新一轮的负载均衡，客户端也会捕获这些事件来进行新一轮的处理。

Orderer排序服务是Fabric网络事务流中的最重要的环节，也是所有请求的终点，它并不会立刻对请求给予回馈，一是因为生成区块的条件有限，二是因为依托下游集群的消息处理需要等待结果。

# 集群环境搭建：
搭建Kafka集群的最小单元组成：
```
Zookeeper节点集群：3个节点
Kafka节点集群：4个节点
Orderer排序节点集群：3个节点
其他peer节点：最少2个
```
因此这个网络集群最少需要12个节点。


# 部署节点

我购买了12台云服务器，分别给服务器命名，并且对应IP地址如下：

节点名称   | IP Address  | Hostname                   | Org?    | Password
---        |---          | ---                        | ---     | ---
Zookeeper1 | 107.191.42.201 |  Zookeeper1             | ——      | s2_KHfAPfwgwZdbf
Zookeeper2 | 45.63.14.242  |  Zookeeper2                | ——    | )Tr9@Q,g9Q6Mk6QE
Zookeeper3 | 45.77.150.15 |  Zookeeper3          | —— |D9#vkZRa@.GHSyG=
Kafka1     | 207.246.88.170  |  Kafka1                    | —— | $7MwN3)zxtU.s!F9
Kafka2     | 149.28.50.99 |  Kafka2                    | —— | 5Dw=)=RYcKK%FyLt
Kafka3     | 45.77.200.129 |  Kafka3                    | —— | P9s?uD97CWT_P]M.
Kafka4     | 207.246.85.191|  Kafka4                    | —— | -Wd3KqJM!mx?=L%d
Orderer0   | 45.63.13.222|  orderer0.example.com  | —— | e!6P[yeRry_z,PJJ
Orderer1   | 207.246.123.157 |  orderer1.example.com      | —— | Ua!3Z5T@?6CKgnK,
Orderer2   | 108.61.66.247|  orderer2.example.com      | —— | Pj3*5yfqV]_g@*W2
Peer0      | 216.155.152.215|  pee0.org1.example.com     | Org1 |k.4QGftMRfz*c$N#
foo27      | 45.77.99.221|  foo27.org5.example.com     | Org5    | (k4Rca%FD)u#]R$2
bar        |140.82.60.179 |bar.org5.example.com   | Org5  |3X.x4_LzR8,AJxG.
    

编写配置文件如下,具体内容见Kafka集群配置文件夹：

## Zookeeper

Zookeeper1:

- docker-zookeeper1.yaml

- [环境配置] : 仅仅需要安装docker 以及docker-compose环境 


Zookeeper2:

- docker-zookeeper2.yaml

- [环境配置] : 仅仅需要安装docker 以及docker-compose环境 

Zookeeper3:

- docker-zookeeper3.yaml

- [环境配置] : 仅仅需要安装docker 以及docker-compose环境 

## Kafka

Kafka1:

- docker-kafka1.yaml

- [环境配置] : 仅仅需要安装docker 以及docker-compose环境 

Kafka2:

- docker-kafka2.yaml

- [环境配置] : 仅仅需要安装docker 以及docker-compose环境 

Kafka3:

- docker-kafka3.yaml

- [环境配置] : 仅仅需要安装docker 以及docker-compose环境 

Kafka4:

- docker-kafka4.yaml

- [环境配置] : 仅仅需要安装docker 以及docker-compose环境 

## Orderer

Orderer0:

- channel-artifacts/genesis.block
- crypto-config/ordererOrganizations
- docker-orderer0.yaml
- configtx.yaml(可选操作，可以不复制到服务器中，如果需要使用configtxgen命令，则需要复制到服务器中)

- [环境配置] : 需仅仅需要安装docker、docker-compose,可选安装Go语言及Fabric环境
- [补充说明] : 为了节点间，保证部分信息的隐私安全，组织结构与配置文件夹需要在本地生成，且针对与orderer节点仅仅上传ordererOrganization文件夹下的内容

Orderer1:

- channel-artifacts/genesis.block
- crypto-config/ordererOrganizations
- docker-orderer1.yaml
- configtx.yaml(可选操作，可以不复制到服务器中，如果需要使用configtxgen命令，则需要复制到服务器中)

- [环境配置] : 仅仅需要安装docker、docker-compose,可选安装Go语言及Fabric环境
- [补充说明] : 为了节点间，保证部分信息的隐私安全，组织结构与配置文件夹需要在本地生成，且针对与orderer节点仅仅上传ordererOrganization文件夹下的内容

Orderer2:

- channel-artifacts/genesis.block
- crypto-config/ordererOrganizations
- docker-orderer2.yaml
- configtx.yaml(可选操作，可以不复制到服务器中，如果需要使用configtxgen命令，则需要复制到服务器中)

- [环境配置] : 仅仅需要安装docker、docker-compose,可选安装Go语言及Fabric环境
- [补充说明] : 为了节点间，保证部分信息的隐私安全，组织结构与配置文件夹需要在本地生成，且针对与orderer节点仅仅上传ordererOrganization文件夹下的内容

## peer

Peer0Org1

- crypto-config/peerOrganizations/org1.example.com
- channel-artifacts/mychannel.tx
- docker-peer0org1.yaml

- [环境配置] : 需要安装docker、docker-compose、Go语言及Fabric环境
- [补充说明] : peer0org1节点仅仅需要org1.example.com中的组织结构及配置文件，因此，仅仅复制该文件夹下的内容到远程服务器即可


Foo27Org5

- configtx.yaml
- crypto-config.yaml
- docker-peerfoo27org5.yaml

声明一下：

当进入远程服务器之后，我们统一在这些服务器中创建工作目录：/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures，之后，我们的配置文件将放在这个工作目录下。

节点的配置步骤如下：

1. Zookeeper集群
2. Kafka集群
3. Orderer集群
4. Peer0Org1节点

当peer节点配置完毕之后，我们就可以进行Fabric-Kafka集群模式测试了！

相关网址如下：

- [Docker安装官方指导教程](https://docs.docker.com/install/#reporting-security-issues) 

相关命令如下：

从本地复制文件到远程服务器中
```bash
scp local_file remote_username@remote_ip:remote_folder 
```
在远程服务器上创建工作目录
```bash
mkdir -p /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
```
在本地生成组织结构与配置文件
```bash
cryptogen generate  --config ./crypto-config.yaml  --output  crypto-config

mkdir channel-artifacts
export FABRIC_CFG_PATH=$PWD
export CHANNEL_NAME=mychannel
configtxgen  -profile FiveOrgsOrdererGenesis  -outputBlock     ./channel-artifacts/genesis.block
configtxgen  -profile FiveOrgsChannel -outputCreateChannelTx   ./channel-artifacts/mychannel.tx     -channelID $CHANNEL_NAME
configtxgen  -profile FiveOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org1MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org1MSP

configtxgen  -profile FiveOrgsChannel -outputAnchorPeersUpdate ./channel-artifacts/Org5MSPanchors.tx -channelID $CHANNEL_NAME -asOrg Org5MSP
```



# 启动集群

启动集群的顺序如下;

1. Zookeeper集群
2. Kafka集群
3. Orderer集群


## 启动Zookeeper集群
```bash
启动Zookeeper1
ssh root@107.191.42.201
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-zookeeper1.yaml up -d
docker ps


启动Zookeeper2
ssh root@45.63.14.242
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-zookeeper2.yaml up -d
docker ps

启动Zookeeper3
ssh root@45.77.150.15
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-zookeeper3.yaml up -d
docker ps

查看3个节点的日志信息
在Zookeeper1上:
docker logs zookeeper1 

在Zookeeper2上:
docker logs zookeeper2

在Zookeeper3上:
docker logs zookeeper3
```

启动后的分析:请查看./Analysis/ZookeeperStartupAnalysis.md

## 启动Kafka集群
```bash
启动Kafka1
ssh root@207.246.88.170 
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka1.yaml up -d
docker ps

启动Kafka2
ssh root@149.28.50.99 
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka2.yaml up -d
docker ps

启动Kafka3
ssh root@45.77.200.129 
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka3.yaml up -d
docker ps

启动Kafka4
ssh root@207.246.85.191 
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka4.yaml up -d
docker ps

查看4个节点的日志信息
在Kafka1上:
docker logs kafka1 

在Kafka2上:
docker logs kafka2

在Kafka3上:
docker logs kafka3 

在Kafka4上:
docker logs kafka4 
```

启动后的分析:请查看./Analysis/KafkaStartupAnalysis.md


## 启动Orderer集群
```bash
启动Orderer0
ssh root@45.63.13.222 
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-orderer0.yaml up -d
docker ps

启动Orderer1
ssh root@207.246.123.157 
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-orderer1.yaml up -d
docker ps

启动Orderer2
ssh root@108.61.66.247
docker-compose -f /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-orderer2.yaml up -d
docker ps


查看3个节点的日志信息
在Orderer0上:
docker logs orderer0.example.com

在Orderer1上:
docker logs orderer1.example.com

在Orderer2上:
docker logs orderer2.example.com
```
启动后的分析:请查看./Analysis/OrdererStartupAnalysis.md

为了使得启动集群更加方便，我编写Makefile文件，用于简化启动集群的步骤。


# 链码测试

启动peer0org1节点：
```bash
make peer0org1-up

进入远程服务器
ssh root@216.155.152.215

docker logs peer0.org1.example.com

进入cli容器:
docker exec -it cli bash

peer channel create -o orderer0.example.com:7050 -c mychannel -t 50s -f ./channel-artifacts/mychannel.tx --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

peer channel join -b mychannel.block
peer chaincode install -n mycc -p github.com/hyperledger/fabric/chaincode -v 1.0
peer chaincode instantiate -o orderer0.example.com:7050 -C mychannel -n mycc -c '{"Args":["init","A","10","B","20"]}' -P "OR ('Org1MSP.member','Org5MSP.member')" -v 1.0 --tls --cafile /opt/gopath/src/github.com/hyperledger/fabric/peer/crypto/ordererOrganizations/example.com/orderers/orderer0.example.com/msp/tlscacerts/tlsca.example.com-cert.pem

peer chaincode query -C mychannel -n mycc -c '{"Args":["query","A"]}'
```
如果测试成功,正确的输出结果如下：
```bash
root@8f9990af6f2c:/opt/gopath/src/github.com/hyperledger/fabric/peer# peer chaincode query -C mychannel -n mycc -c '{"Args":["query","A"]}'
10
```
### 跨组织数据同步测试

---

> 如果需要在节点peer0org1节点中添加其他的IP地址，可以关闭peer0org1节点网络，然后，修改docker-peer0org1.yaml

因为peer0org1已经创建了应用通道,所以仅仅需要将foo27org5添加到到应用通道中即可。foo27org5若是想加入该peer0org1节点创建的通道中，首先需要获取该通道的block文件，并以此为入口加入。
peer0org1创建的了一个mychannel.block文件位于cli容器内/opt/gopath/src/github.com/hyperledger/fabric/peer目录下。
```bash
root@8f9990af6f2c:/opt/gopath/src/github.com/hyperledger/fabric/peer# ls
channel-artifacts  crypto  mychannel.block
```
为了能够把该文件下复制到物理机的真实路径中，可以先退出cli容器，执行如下命令：
```bash
docker cp bee05ea7925f:/opt/gopath/src/github.com/hyperledger/fabric/peer/mychannel.block  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts/
```
使用docker ps命令，你会发现8f9990af6f2c就是cli的容器ID。

接下来我们可以将这个mychannel.block文件发送给foo27org5节点，使用如下命令：
```bash
scp ./channel-artifacts/mychannel.block root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts/
```


启动foo27org5节点：
```bash
make 

进入远程服务器
ssh root@45.77.99.221

docker logs foo27.org5.example.com

首先将mychannel.block复制到cli容器中,其中cli容器ID需要使用docker ps命令查看
docker cp /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts/mychannel.block  d54134114c23:/opt/gopath/src/github.com/hyperledger/fabric/peer/  
```
scp ./channel-artifacts/mychannel2.tx root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts

在foo27org5节点上安装链码，并查询链码信息：
```bash
进入cli容器
docker exec -it cli bash

peer channel join -b mychannel.block

peer chaincode install -n mycc -p github.com/hyperledger/fabric/chaincode -v 1.0

peer chaincode query -C mychannel -n mycc -c '{"Args":["query","A"]}'

```




bar.org5.example.com
```bash
在peer0org1节点服务器上执行命令
scp ./channel-artifacts/mychannel.block root@140.82.60.179:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts/

docker cp /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts/mychannel.block  acc5f09aefd1:/opt/gopath/src/github.com/hyperledger/fabric/peer/  

进入cli容器
docker exec -it cli bash

peer channel join -b mychannel.block 

peer chaincode install -n mycc -p github.com/hyperledger/fabric/chaincode -v 1.0

peer chaincode invoke -C mychannel -n mycc -c '{"Args":["invoke","A","B","20"]}'

peer chaincode query -C mychannel -n mycc -c '{"Args":["query","A"]}'

```

通道检查
```bash
peer channel list //查看通道
peer chaincode list --instantiated -C mychannel  //查看通道中被安装的链码
```



--- 

# 问题

1. 每次重新启动容器的时候，cli容器的镜像ID就会改变，这造成了原本复制到cli容器中的mychannel.block文件消失，需要重新复制到容器中，此外peer节点需要重新加入通道。

# 报错处理

报错1：

[root@zookeeper1 fixtures]# docker ps
Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?

原因docker守护进程没有启动，解决办法，启动docker守护进程
```bash
systemctl start docker
```

报错2：
root@4e197ade526a:/opt/gopath/src/github.com/hyperledger/fabric/peer# peer channel list
Error: error getting endorser client for channel: endorser client failed to connect to peer0.org1.example.com:7051: failed to create new connection: connection error: desc = "transport: error while dialing: dial tcp 216.155.152.215:7051: connect: no route to host"

有虚拟机防火墙都关闭了,[参考网址](https://blog.csdn.net/ytangdigl/article/details/79796961):
```bash
systemctl stop firewalld.service
```
报错3：
Error: failed to create deliver client: orderer client failed to connect to orderer0.example.com:7050: failed to create new connection: context deadline exceeded

原因：orderer0.example.com节点网络没有启动。或者之前已经启动过了需要重新启动,也或者是- ORDERER_GENERAL_TLS_ENABLED设置成了false

报错4：
ERROR: Failed to Setup IP tables: Unable to enable SKIP DNAT rule:  (iptables failed: iptables --wait -t nat -I DOCKER -i br-2add1a39bc5d -j RETURN: iptables: No chain/target/match by that name.

原因是关闭防火墙之后docker需要重启，执行以下命令重启docker即可：
```bash
systemctl restart docker
```
报错5：
在cli中创建通道时报错
Error: got unexpected status: BAD_REQUEST -- error applying config update to existing channel 'mychannel': error authorizing update: error validating ReadSet: proposed update requires that key [Group]  /Channel/Application be at version 0, but it is currently at version 1
