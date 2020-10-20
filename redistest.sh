#!/bin/bash
./bin/ycsb load redis -s -P workloads/workloada -p "redis.host=127.0.0.1" -p "redis.port=6379" | awk '{print $2 $3}' > REDISoutLoadA.txt
sleep 5
./bin/ycsb load redis -s -P workloads/workloada -p "redis.host=127.0.0.1" -p "redis.port=6379" | awk '{print $2 $3}' > REDISoutRunA.txt
sleep 5
./bin/ycsb load redis -s -P workloads/workloadb -p "redis.host=127.0.0.1" -p "redis.port=6379" | awk '{print $3}' > REDISoutLoadB.txt
sleep 5
./bin/ycsb load redis -s -P workloads/workloadb -p "redis.host=127.0.0.1" -p "redis.port=6379" | awk '{print $3}' > REDISoutRunB.txt
sleep 5
./bin/ycsb load redis -s -P workloads/workloadc -p "redis.host=127.0.0.1" -p "redis.port=6379" | awk '{print $3}' > REDISoutLoadC.txt
sleep 5
./bin/ycsb load redis -s -P workloads/workloadc -p "redis.host=127.0.0.1" -p "redis.port=6379" | awk '{print $3}' > REDISoutRunC.txt
sleep 5
./bin/ycsb load redis -s -P workloads/workloadd -p "redis.host=127.0.0.1" -p "redis.port=6379" | awk '{print $3}' > REDISoutLoadD.txt
sleep 5
./bin/ycsb load redis -s -P workloads/workloadd -p "redis.host=127.0.0.1" -p "redis.port=6379" | awk '{print $3}' > REDISoutRunD.txt

#merge results into csv
perl loadmerge.pl REDISoutLoad* > redis_load_results.csv
perl runmerge.pl REDISoutRun* > redis_run_results.csv

#cleanup
rm REDISout*
