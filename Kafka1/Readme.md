1.复制文件到远程工作目录中
```bash
scp ./docker-kafka1.yaml root@207.246.88.170:/home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
```
2.登录远程主机
```bash
ssh root@207.246.88.170 
```
3.进入远程主机工作目录
```bash
cd /home/gopath/src/github.com/hyperledgerFabricCluster/fixtures
```
4.查看文件是否传输成功
```bash
[root@kafka1 fixtures]# ls
docker-kafka1.yaml
```
5.启动kafka1节点（仅仅测试）
```bash
docker-compose -f docker-kafka1.yaml up -d
```
执行这个命令之后，将会下载latest版本的kafka镜像，通过docker ps 命令可查看，但我需要安装0.4.14的镜像，所以需要从仓库拉去指定版本的zookeeper镜像。
```bash
docker pull  hyperledger/fabric-kafka:0.4.14
```

其他

关闭节点网络
```bash
docker-compose -f docker-kafka1.yaml down
```
查看容器日志
```bash
docker logs kafka1
```