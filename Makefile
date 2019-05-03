#如果修改了部分文件就执行如下命令重新向远程服务器发送修改后的文件
.PHONY: resendConfigFile


# zookeeper

zookeeper-resendConfigFile:
	@scp ./Zookeeper1/docker-zookeeper1.yaml root@107.191.42.201:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
	@scp ./Zookeeper2/docker-zookeeper2.yaml root@45.63.14.242:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
	@scp ./Zookeeper3/docker-zookeeper3.yaml root@45.77.150.15:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures

zookeeper-up:
	@ssh root@107.191.42.201 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-zookeeper1.yaml up -d; docker ps"
	@ssh root@45.63.14.242 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-zookeeper2.yaml up -d; docker ps"
	@ssh root@45.77.150.15 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-zookeeper3.yaml up -d; docker ps"

zookeeper-down:
	@ssh root@107.191.42.201 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-zookeeper1.yaml down; docker ps"
	@ssh root@45.63.14.242 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-zookeeper2.yaml down; docker ps"
	@ssh root@45.77.150.15 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-zookeeper3.yaml down; docker ps"

zookeeper-dockerps:
	@echo "zookeeper1 docker ps"
	@ssh root@107.191.42.201 "docker ps"
	@echo "zookeeper2 docker ps"
	@ssh root@45.63.14.242 "docker ps"
	@echo "zookeeper3 docker ps"
	@ssh root@45.77.150.15 "docker ps"


zookeeper-restart: zookeeper-down zookeeper-up

# kafka

kafka-resendConfigFile:
	@scp ./Kafka1/docker-kafka1.yaml root@207.246.88.170:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
	@scp ./Kafka2/docker-kafka2.yaml root@149.28.50.99:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
	@scp ./Kafka3/docker-kafka3.yaml root@45.77.200.129:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
	@scp ./Kafka4/docker-kafka4.yaml root@207.246.85.191:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures

kafka-up:
	@ssh root@207.246.88.170 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka1.yaml up -d; docker ps"
	@ssh root@149.28.50.99 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka2.yaml up -d; docker ps"
	@ssh root@45.77.200.129 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka3.yaml up -d; docker ps"
	@ssh root@207.246.85.191 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka4.yaml up -d; docker ps"

kafka-down:
	@ssh root@207.246.88.170 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka1.yaml down; docker ps"
	@ssh root@149.28.50.99 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka2.yaml down; docker ps"
	@ssh root@45.77.200.129 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka3.yaml down; docker ps"
	@ssh root@207.246.85.191 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-kafka4.yaml down; docker ps"

kafka-restart: kafka-down kafka-up

kafka-dockerps:
	@echo "kafka1 docker ps"
	@ssh root@207.246.88.170 "docker ps"
	@echo "kafka2 docker ps"	
	@ssh root@149.28.50.99 "docker ps"
	@echo "kafka3 docker ps"
	@ssh root@45.77.200.129 "docker ps"
	@echo "kafka4 docker ps"
	@ssh root@207.246.85.191 "docker ps"

# orderer

orderer-resendConfigFiles:
	@scp ./Orderer0/docker-orderer0.yaml root@45.63.13.222:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
	@scp ./Orderer1/docker-orderer1.yaml root@207.246.123.157:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
	@scp ./Orderer2/docker-orderer2.yaml root@108.61.66.247:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures

orderer-resendConfigFiles2:
	@scp -r ./crypto-config/ordererOrganizations root@45.63.13.222:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config
	@scp    ./channel-artifacts/genesis.block root@45.63.13.222:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts
	@scp -r ./crypto-config/ordererOrganizations root@207.246.123.157:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config
	@scp    ./channel-artifacts/genesis.block root@207.246.123.157:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts
	@scp -r ./crypto-config/ordererOrganizations root@108.61.66.247:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config
	@scp    ./channel-artifacts/genesis.block root@108.61.66.247:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts

orderer-down:
	@ssh root@45.63.13.222 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-orderer0.yaml down; docker ps"
	@ssh root@207.246.123.157 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-orderer1.yaml down; docker ps"
	@ssh root@108.61.66.247 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-orderer2.yaml down; docker ps"

orderer-up:
	@ssh root@45.63.13.222 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-orderer0.yaml up -d; docker ps"
	@ssh root@207.246.123.157 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-orderer1.yaml up -d; docker ps"
	@ssh root@108.61.66.247 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-orderer2.yaml up -d; docker ps"

orderer-restart: orderer-down orderer-up

orderer-dockerps:
	@echo "orderer0 docker ps"
	@ssh root@45.63.13.222 "docker ps"
	@echo "orderer1 docker ps"
	@ssh root@207.246.123.157 "docker ps"
	@echo "orderer2 docker ps"
	@ssh root@108.61.66.247 "docker ps"


# peer0org1

peer0org1-resendConfigFiles2:
	@scp -r ./crypto-config/peerOrganizations/org1.example.com root@216.155.152.215:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config/peerOrganizations
	@scp ./channel-artifacts/mychannel.tx root@216.155.152.215:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts
	@scp ./channel-artifacts/Org1MSPanchors.tx root@216.155.152.215:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts

peer0org1-resendConfigFiles:
	@scp ./Peer0Org1/docker-peer0org1.yaml root@216.155.152.215:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures


peer0org1-up:
	@ssh root@216.155.152.215 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-peer0org1.yaml up -d; docker ps"


peer0org1-down:
	@ssh root@216.155.152.215 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-peer0org1.yaml down; docker ps"

peer0org1-clean:
	@ssh root@216.155.152.215  "docker volume prune -f ; docker network prune -f ; docker rm -f -v `docker ps -a --no-trunc | grep "mycc" | cut -d ' ' -f 1` 2>/dev/null || true ; docker rmi `docker images --no-trunc | grep "mycc" | cut -d ' ' -f 1` 2>/dev/null || true; docker ps"

peer0org1-restart: peer0org1-down peer0org1-up

# foo27org5

foo27org5-resendConfigFiles2:
	@scp -r ./crypto-config/peerOrganizations/org5.example.com root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config/peerOrganizations
	@scp ./channel-artifacts/mychannel.tx root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts
	@scp ./channel-artifacts/Org5MSPanchors.tx root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts

foo27org5-resendConfigFiles:
	@scp ./Foo27Org5/docker-peerfoo27org5.yaml root@45.77.99.221:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures


foo27org5-up:
	@ssh root@45.77.99.221 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-peerfoo27org5.yaml up -d; docker ps"

foo27org5-down:
	@ssh root@45.77.99.221 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-peerfoo27org5.yaml down; docker ps"

foo27org5-clean:
	@ssh root@45.77.99.221 "docker network prune -f ; docker rm -f -v `docker ps -a --no-trunc | grep "mycc" | cut -d ' ' -f 1` 2>/dev/null || true ; docker rmi `docker images --no-trunc | grep "mycc" | cut -d ' ' -f 1` 2>/dev/null || true; docker ps"


# barorg5

barorg5-resendConfigFiles2:
	@scp -r ./crypto-config/peerOrganizations/org5.example.com root@140.82.60.179:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/crypto-config/peerOrganizations
	@scp ./channel-artifacts/mychannel.tx root@140.82.60.179:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts
	@scp ./channel-artifacts/Org5MSPanchors.tx root@140.82.60.179:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/channel-artifacts

barorg5-resendConfigFiles:
	@scp ./Barorg5/docker-barorg5.yaml root@140.82.60.179:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures


barorg5-up:
	@ssh root@140.82.60.179 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-barorg5.yaml up -d; docker ps"


barorg5-down:
	@ssh root@140.82.60.179 "docker-compose -f  /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures/docker-barorg5.yaml down; docker ps"

barorg5-clean:
	@ssh root@140.82.60.179  "docker volume prune -f ; docker network prune -f ; docker rm -f -v `docker ps -a --no-trunc | grep "mycc" | cut -d ' ' -f 1` 2>/dev/null || true ; docker rmi `docker images --no-trunc | grep "mycc" | cut -d ' ' -f 1` 2>/dev/null || true; docker ps"

barorg5-restart: barorg5-down barorg5-up