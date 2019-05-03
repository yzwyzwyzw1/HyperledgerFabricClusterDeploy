以下是orderer集群启动后的日志信息，通过查看日志信息发现，这3个orderer节点的日志信息是一样的，以Orderer1的日志为例子，如下：

orderer0
```bash
2019-04-29 11:30:42.204 UTC [orderer.common.server] Start -> INFO 008 Beginning to serve requests
2019-04-29 11:30:42.205 UTC [orderer.consensus.kafka] setupTopicForChannel -> INFO 009 [channel: testchainid] Setting up the topic for this channel...
2019-04-29 11:30:42.393 UTC [orderer.consensus.kafka] setupProducerForChannel -> INFO 00a [channel: testchainid] Setting up the producer for this channel...
2019-04-29 11:30:43.096 UTC [orderer.consensus.kafka] startThread -> INFO 00b [channel: testchainid] Producer set up successfully
2019-04-29 11:30:43.096 UTC [orderer.consensus.kafka] sendConnectMessage -> INFO 00c [channel: testchainid] About to post the CONNECT message...
2019-04-29 11:30:43.307 UTC [orderer.consensus.kafka] startThread -> INFO 00d [channel: testchainid] CONNECT message posted successfully
2019-04-29 11:30:43.307 UTC [orderer.consensus.kafka] setupParentConsumerForChannel -> INFO 00e [channel: testchainid] Setting up the parent consumer for this channel...
2019-04-29 11:30:43.333 UTC [orderer.consensus.kafka] startThread -> INFO 00f [channel: testchainid] Parent consumer set up successfully
2019-04-29 11:30:43.334 UTC [orderer.consensus.kafka] setupChannelConsumerForChannel -> INFO 010 [channel: testchainid] Setting up the channel consumer for this channel (start offset: -2)...
2019-04-29 11:30:43.348 UTC [orderer.consensus.kafka] startThread -> INFO 011 [channel: testchainid] Channel consumer set up successfully
2019-04-29 11:30:43.386 UTC [orderer.consensus.kafka] startThread -> INFO 012 [channel: testchainid] Start phase completed successfully
```
说明orderer几点成功启动



zookeeper2
```bash
2019-04-29 11:33:52,420 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a689824740002 type:delete cxid:0x45 zxid:0x10000005e txntype:-1 reqpath:n/a Error Path:/admin/preferred_replica_election Error:KeeperErrorCode = NoNode for /admin/preferred_replica_election
2019-04-29 11:33:54,037 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@487] - Processed session termination for sessionid: 0x26a6897f2770002
2019-04-29 11:33:54,045 [myid:2] - INFO  [NIOServerCxn.Factory:0.0.0.0/0.0.0.0:2181:NIOServerCnxn@1008] - Closed socket connection for client /207.246.88.170:45104 which had sessionid 0x26a6897f2770002
2019-04-29 11:33:59,620 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a689824740003 type:create cxid:0x1f zxid:0x100000062 txntype:-1 reqpath:n/a Error Path:/brokers Error:KeeperErrorCode = NodeExists for /brokers
2019-04-29 11:33:59,621 [myid:2] - INFO  [ProcessThread(sid:2 cport:-1)::PrepRequestProcessor@649] - Got user-level KeeperException when processing sessionid:0x36a689824740003 type:create cxid:0x20 zxid:0x100000063 txntype:-1 reqpath:n/a Error Path:/brokers/ids Error:KeeperErrorCode = NodeExists for /brokers/ids
```