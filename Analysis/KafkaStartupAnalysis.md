以下日志信息，为Kafka集群的4个节点的日志信息的部分内容，从日志信息可以看出，除了id号不同外，其他信息基本相同。

kafka1
```bash
[2019-04-28 13:03:11,410] INFO [TransactionCoordinator id=1] Startup complete. (kafka.coordinator.transaction.TransactionCoordinator)
[2019-04-28 13:03:11,421] INFO [Transaction Marker Channel Manager 1]: Starting (kafka.coordinator.transaction.TransactionMarkerChannelManager)
[2019-04-28 13:03:11,872] INFO Creating /brokers/ids/1 (is it secure? false) (kafka.utils.ZKCheckedEphemeral)
[2019-04-28 13:03:11,882] INFO Result of znode creation is: OK (kafka.utils.ZKCheckedEphemeral)
[2019-04-28 13:03:11,884] INFO Registered broker 1 at path /brokers/ids/1 with addresses: EndPoint(kafka1,9092,ListenerName(PLAINTEXT),PLAINTEXT) (kafka.utils.ZkUtils)
[2019-04-28 13:03:11,886] WARN No meta.properties file under dir /tmp/kafka-logs/meta.properties (kafka.server.BrokerMetadataCheckpoint)
[2019-04-28 13:03:12,092] INFO Kafka version : 1.0.0 (org.apache.kafka.common.utils.AppInfoParser)
[2019-04-28 13:03:12,092] INFO Kafka commitId : aaa7af6d4a11b29d (org.apache.kafka.common.utils.AppInfoParser)
[2019-04-28 13:03:12,093] INFO [KafkaServer id=1] started (kafka.server.KafkaServer)
```
kafka2
```bash
[2019-04-28 13:03:52,637] INFO [TransactionCoordinator id=2] Startup complete. (kafka.coordinator.transaction.TransactionCoordinator)
[2019-04-28 13:03:52,639] INFO [Transaction Marker Channel Manager 2]: Starting (kafka.coordinator.transaction.TransactionMarkerChannelManager)
[2019-04-28 13:03:52,723] INFO Creating /brokers/ids/2 (is it secure? false) (kafka.utils.ZKCheckedEphemeral)
[2019-04-28 13:03:52,746] INFO Result of znode creation is: OK (kafka.utils.ZKCheckedEphemeral)
[2019-04-28 13:03:52,747] INFO Registered broker 2 at path /brokers/ids/2 with addresses: EndPoint(kafka2,9092,ListenerName(PLAINTEXT),PLAINTEXT) (kafka.utils.ZkUtils)
[2019-04-28 13:03:52,749] WARN No meta.properties file under dir /tmp/kafka-logs/meta.properties (kafka.server.BrokerMetadataCheckpoint)
[2019-04-28 13:03:52,766] INFO Kafka version : 1.0.0 (org.apache.kafka.common.utils.AppInfoParser)
[2019-04-28 13:03:52,766] INFO Kafka commitId : aaa7af6d4a11b29d (org.apache.kafka.common.utils.AppInfoParser)
[2019-04-28 13:03:52,769] INFO [KafkaServer id=2] started (kafka.server.KafkaServer)
```
kafka3
```bash
[2019-04-28 13:03:58,144] INFO [TransactionCoordinator id=3] Startup complete. (kafka.coordinator.transaction.TransactionCoordinator)
[2019-04-28 13:03:58,146] INFO [Transaction Marker Channel Manager 3]: Starting (kafka.coordinator.transaction.TransactionMarkerChannelManager)
[2019-04-28 13:03:58,237] INFO Creating /brokers/ids/3 (is it secure? false) (kafka.utils.ZKCheckedEphemeral)
[2019-04-28 13:03:58,260] INFO Result of znode creation is: OK (kafka.utils.ZKCheckedEphemeral)
[2019-04-28 13:03:58,261] INFO Registered broker 3 at path /brokers/ids/3 with addresses: EndPoint(kafka3,9092,ListenerName(PLAINTEXT),PLAINTEXT) (kafka.utils.ZkUtils)
[2019-04-28 13:03:58,263] WARN No meta.properties file under dir /tmp/kafka-logs/meta.properties (kafka.server.BrokerMetadataCheckpoint)
[2019-04-28 13:03:58,277] INFO Kafka version : 1.0.0 (org.apache.kafka.common.utils.AppInfoParser)
[2019-04-28 13:03:58,277] INFO Kafka commitId : aaa7af6d4a11b29d (org.apache.kafka.common.utils.AppInfoParser)
[2019-04-28 13:03:58,281] INFO [KafkaServer id=3] started (kafka.server.KafkaServer)
```
kafka4
```bash
[2019-04-28 13:04:05,502] INFO [TransactionCoordinator id=4] Startup complete. (kafka.coordinator.transaction.TransactionCoordinator)
[2019-04-28 13:04:05,506] INFO [Transaction Marker Channel Manager 4]: Starting (kafka.coordinator.transaction.TransactionMarkerChannelManager)
[2019-04-28 13:04:05,571] INFO Creating /brokers/ids/4 (is it secure? false) (kafka.utils.ZKCheckedEphemeral)
[2019-04-28 13:04:05,585] INFO Result of znode creation is: OK (kafka.utils.ZKCheckedEphemeral)
[2019-04-28 13:04:05,587] INFO Registered broker 4 at path /brokers/ids/4 with addresses: EndPoint(kafka4,9092,ListenerName(PLAINTEXT),PLAINTEXT) (kafka.utils.ZkUtils)
[2019-04-28 13:04:05,588] WARN No meta.properties file under dir /tmp/kafka-logs/meta.properties (kafka.server.BrokerMetadataCheckpoint)
[2019-04-28 13:04:05,599] INFO Kafka version : 1.0.0 (org.apache.kafka.common.utils.AppInfoParser)
[2019-04-28 13:04:05,599] INFO Kafka commitId : aaa7af6d4a11b29d (org.apache.kafka.common.utils.AppInfoParser)
[2019-04-28 13:04:05,601] INFO [KafkaServer id=4] started (kafka.server.KafkaServer)
```

当Kafka单个节点启动的时候，在Zookeeper集群的Leader节点（此处是zookeeper2节点）服务器中的日志记录反馈信息，当所有节点启动后的反馈信息如下：
```bash
2019-04-28 12:49:45,128 [myid:2] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxnFactory@192] - Accepted socket connection from /127.0.0.1:51738
2019-04-28 12:49:45,143 [myid:2] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@827] - Processing srvr command from /127.0.0.1:51738
2019-04-28 12:49:45,150 [myid:2] - INFO  [Thread-4:NIOServerCnxn@1008] - Closed socket connection for client /127.0.0.1:51738 (no session established for client)
2019-04-28 13:03:07,353 [myid:2] - INFO  [SyncThread:2:FileTxnLog@203] - Creating new log file: log.100000001
2019-04-28 13:03:07,450 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a63ee2cf50000 type:create cxid:0x5 zxid:0x100000003 txntype:-1 reqpath:n/a Error Path:/brokers Error:KeeperErrorCode = NoNode for /brokers
2019-04-28 13:03:07,517 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a63ee2cf50000 type:create cxid:0xb zxid:0x100000007 txntype:-1 reqpath:n/a Error Path:/config Error:KeeperErrorCode = NoNode for /config
2019-04-28 13:03:07,587 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a63ee2cf50000 type:create cxid:0x13 zxid:0x10000000c txntype:-1 reqpath:n/a Error Path:/admin Error:KeeperErrorCode = NoNode for /admin
2019-04-28 13:03:07,815 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a63ee2cf50000 type:create cxid:0x1f zxid:0x100000013 txntype:-1 reqpath:n/a Error Path:/cluster Error:KeeperErrorCode = NoNode for /cluster
2019-04-28 13:03:10,684 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a63ee2cf50000 type:setData cxid:0x2a zxid:0x100000017 txntype:-1 reqpath:n/a Error Path:/controller_epoch Error:KeeperErrorCode = NoNode for /controller_epoch
2019-04-28 13:03:11,497 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a63ee2cf50000 type:delete cxid:0x41 zxid:0x10000001a txntype:-1 reqpath:n/a Error Path:/admin/preferred_replica_election Error:KeeperErrorCode = NoNode for /admin/preferred_replica_election
2019-04-28 13:03:11,878 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a63ee2cf50000 type:create cxid:0x4b zxid:0x10000001b txntype:-1 reqpath:n/a Error Path:/brokers Error:KeeperErrorCode = NodeExists for /brokers
2019-04-28 13:03:11,878 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a63ee2cf50000 type:create cxid:0x4c zxid:0x10000001c txntype:-1 reqpath:n/a Error Path:/brokers/ids Error:KeeperErrorCode = NodeExists for /brokers/ids
2019-04-28 13:03:52,730 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x16a63ed571a0000 type:create cxid:0x1d zxid:0x100000020 txntype:-1 reqpath:n/a Error Path:/brokers Error:KeeperErrorCode = NodeExists for /brokers
2019-04-28 13:03:52,730 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x16a63ed571a0000 type:create cxid:0x1e zxid:0x100000021 txntype:-1 reqpath:n/a Error Path:/brokers/ids Error:KeeperErrorCode = NodeExists for /brokers/ids
2019-04-28 13:03:56,346 [myid:2] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxnFactory@192] - Accepted socket connection from /45.77.200.129:34900
2019-04-28 13:03:56,364 [myid:2] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:ZooKeeperServer@928] - Client attempting to establish new session at /45.77.200.129:34900
2019-04-28 13:03:56,373 [myid:2] - INFO  [CommitProcessor:2:ZooKeeperServer@673] - Established session 0x26a63ed572c0000 with negotiated timeout 6000 for client /45.77.200.129:34900
2019-04-28 13:03:58,244 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x26a63ed572c0000 type:create cxid:0x1d zxid:0x100000025 txntype:-1 reqpath:n/a Error Path:/brokers Error:KeeperErrorCode = NodeExists for /brokers
2019-04-28 13:03:58,245 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x26a63ed572c0000 type:create cxid:0x1e zxid:0x100000026 txntype:-1 reqpath:n/a Error Path:/brokers/ids Error:KeeperErrorCode = NodeExists for /brokers/ids
2019-04-28 13:04:05,575 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x16a63ed571a0001 type:create cxid:0x1d zxid:0x10000002a txntype:-1 reqpath:n/a Error Path:/brokers Error:KeeperErrorCode = NodeExists for /brokers
2019-04-28 13:04:05,576 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x16a63ed571a0001 type:create cxid:0x1e zxid:0x10000002b txntype:-1 reqpath:n/a Error Path:/brokers/ids Error:KeeperErrorCode = NodeExists for /brokers/ids

```