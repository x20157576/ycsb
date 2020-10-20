#!/bin/bash
#Run workload A load and run
datadir="../../ycsb-0.17.0"

$datadir/bin/ycsb load mongodb -s -P $datadir/workloads/workloada -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 | awk '{print $2 $3}' > MongoDBoutLoadA.txt
#sleep 10
$datadir/bin/ycsb run mongodb -s -P $datadir/workloads/workloada -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 | awk '{print $2 $3}'  > MongoDBoutRunA.txt
#sleep 10
$datadir/bin/ycsb load mongodb -s -P $datadir/workloads/workloadb -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 | awk '{print $3}' > MongoDBoutLoadB.txt
#sleep 10
$datadir/bin/ycsb run mongodb -s -P $datadir/workloads/workloadb -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 | awk '{print $3}' > MongoDBoutRunB.txt
#sleep 10
$datadir/bin/ycsb load mongodb -s -P $datadir/workloads/workloadc -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 | awk '{print $3}' > MongoDBoutLoadC.txt
#sleep 10
$datadir/bin/ycsb run mongodb -s -P $datadir/workloads/workloadc -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 | awk '{print $3}' > MongoDBoutRunC.txt
#sleep 10
$datadir/bin/ycsb load mongodb -s -P $datadir/workloads/workloadd -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 | awk '{print $3}' > MongoDBoutLoadD.txt
#sleep 10
$datadir/bin/ycsb run mongodb -s -P $datadir/workloads/workloadd -p mongodb.url=mongodb://localhost:27017/ycsb?w=0 | awk '{print $3}' > MongoDBoutRunD.txt


# merge the results file into one csv
perl loadmerge.pl MongoDBoutLoad* > mongodb_load_results.csv
perl runmerge.pl MongoDBoutRun* > mongodb_run_results.csv

#cleanup
rm  MongoDBout*

