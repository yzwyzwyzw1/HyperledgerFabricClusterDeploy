
以下是查询Zookeeper节点启动后的日志信息，通过以下信息，不难发现Zookeeper2节点在本次通信中被选举为Leader节点。
Zookeeper1
```bash
2019-04-28 12:30:59,797 [myid:1] - INFO  [QuorumPeer[myid=1]/0.0.0.0:2181:ZooKeeperServer@173] - Created server with tickTime 2000 minSessionTimeout 4000 maxSessionTimeout 40000 datadir /datalog/version-2 snapdir /data/version-2
2019-04-28 12:30:59,800 [myid:1] - INFO  [QuorumPeer[myid=1]/0.0.0.0:2181:Follower@61] - FOLLOWING - LEADER ELECTION TOOK - 120025
2019-04-28 12:30:59,823 [myid:1] - INFO  [QuorumPeer[myid=1]/0.0.0.0:2181:QuorumPeer$QuorumServer@149] - Resolved hostname: zookeeper2 to address: zookeeper2/45.63.14.242
2019-04-28 12:30:59,859 [myid:1] - INFO  [QuorumPeer[myid=1]/0.0.0.0:2181:Learner@326] - Getting a diff from the leader 0x0
2019-04-28 12:30:59,867 [myid:1] - INFO  [QuorumPeer[myid=1]/0.0.0.0:2181:FileTxnSnapLog@240] - Snapshotting: 0x0 to /data/version-2/snapshot.0
2019-04-28 12:31:54,545 [myid:1] - INFO  [zookeeper1/172.20.0.2:3888:QuorumCnxManager$Listener@541] - Received connection request /45.77.150.15:49238
2019-04-28 12:31:54,552 [myid:1] - INFO  [WorkerReceiver[myid=1]:FastLeaderElection@600] - Notification: 1 (message format version), 3 (n.leader), 0x0 (n.zxid), 0x1 (n.round), LOOKING (n.state), 3 (n.sid), 0x0 (n.peerEpoch) FOLLOWING (my state)
```
Zookeeper2
```bash
2019-04-28 12:30:59,772 [myid:2] - INFO  [QuorumPeer[myid=2]/0.0.0.0:2181:ZooKeeperServer@173] - Created server with tickTime 2000 minSessionTimeout 4000 maxSessionTimeout 40000 datadir /datalog/version-2 snapdir /data/version-2
2019-04-28 12:30:59,774 [myid:2] - INFO  [QuorumPeer[myid=2]/0.0.0.0:2181:Leader@361] - LEADING - LEADER ELECTION TOOK - 279
2019-04-28 12:30:59,846 [myid:2] - INFO  [LearnerHandler-/107.191.42.201:58482:LearnerHandler@329] - Follower sid: 1 : info : org.apache.zookeeper.server.quorum.QuorumPeer$QuorumServer@7dd41650
2019-04-28 12:30:59,858 [myid:2] - INFO  [LearnerHandler-/107.191.42.201:58482:LearnerHandler@384] - Synchronizing with Follower sid: 1 maxCommittedLog=0x0 minCommittedLog=0x0 peerLastZxid=0x0
2019-04-28 12:30:59,858 [myid:2] - INFO  [LearnerHandler-/107.191.42.201:58482:LearnerHandler@393] - leader and follower are in sync, zxid=0x0
2019-04-28 12:30:59,859 [myid:2] - INFO  [LearnerHandler-/107.191.42.201:58482:LearnerHandler@458] - Sending DIFF
2019-04-28 12:30:59,879 [myid:2] - INFO  [LearnerHandler-/107.191.42.201:58482:LearnerHandler@518] - Received NEWLEADER-ACK message from 1
2019-04-28 12:30:59,880 [myid:2] - INFO  [QuorumPeer[myid=2]/0.0.0.0:2181:Leader@952] - Have quorum of supporters, sids: [ 1,2 ]; starting up and setting last processed zxid: 0x100000000
2019-04-28 12:31:54,554 [myid:2] - INFO  [zookeeper2/172.19.0.2:3888:QuorumCnxManager$Listener@541] - Received connection request /45.77.150.15:41760
2019-04-28 12:31:54,563 [myid:2] - INFO  [WorkerReceiver[myid=2]:FastLeaderElection@600] - Notification: 1 (message format version), 3 (n.leader), 0x0 (n.zxid), 0x1 (n.round), LOOKING (n.state), 3 (n.sid), 0x0 (n.peerEpoch) LEADING (my state)
2019-04-28 12:31:54,598 [myid:2] - INFO  [LearnerHandler-/45.77.150.15:35192:LearnerHandler@329] - Follower sid: 3 : info : org.apache.zookeeper.server.quorum.QuorumPeer$QuorumServer@48c74c5e
2019-04-28 12:31:54,604 [myid:2] - INFO  [LearnerHandler-/45.77.150.15:35192:LearnerHandler@384] - Synchronizing with Follower sid: 3 maxCommittedLog=0x0 minCommittedLog=0x0 peerLastZxid=0x0
2019-04-28 12:31:54,605 [myid:2] - INFO  [LearnerHandler-/45.77.150.15:35192:LearnerHandler@458] - Sending SNAP
2019-04-28 12:31:54,606 [myid:2] - INFO  [LearnerHandler-/45.77.150.15:35192:LearnerHandler@482] - Sending snapshot last zxid of peer is 0x0  zxid of leader is 0x100000000sent zxid of db as 0x100000000
2019-04-28 12:31:54,618 [myid:2] - INFO  [LearnerHandler-/45.77.150.15:35192:LearnerHandler@518] - Received NEWLEADER-ACK message from 3
```
Zookeeper3
```bash
2019-04-28 12:31:54,581 [myid:3] - INFO  [QuorumPeer[myid=3]/0.0.0.0:2181:ZooKeeperServer@173] - Created server with tickTime 2000 minSessionTimeout 4000 maxSessionTimeout 40000 datadir /datalog/version-2 snapdir /data/version-2
2019-04-28 12:31:54,583 [myid:3] - INFO  [QuorumPeer[myid=3]/0.0.0.0:2181:Follower@61] - FOLLOWING - LEADER ELECTION TOOK - 48
2019-04-28 12:31:54,585 [myid:3] - INFO  [QuorumPeer[myid=3]/0.0.0.0:2181:QuorumPeer$QuorumServer@149] - Resolved hostname: zookeeper2 to address: zookeeper2/45.63.14.242
2019-04-28 12:31:54,604 [myid:3] - INFO  [QuorumPeer[myid=3]/0.0.0.0:2181:Learner@329] - Getting a snapshot from leader
2019-04-28 12:31:54,613 [myid:3] - INFO  [QuorumPeer[myid=3]/0.0.0.0:2181:FileTxnSnapLog@240] - Snapshotting: 0x100000000 to /data/version-2/snapshot.100000000
```

在Zookeeper2节点上执行如下命令：
```bash
docker exec -it zookeeper2 bash
```
进入容器后输入如下命令，并得到输出结果：
```bash
root@zookeeper2:/zookeeper-3.4.9# ./bin/zkServer.sh status
ZooKeeper JMX enabled by default
Using config: /conf/zoo.cfg
Mode: leader
```

如果能够正常看到这些信息，说明Zookeeper集群启动成功。