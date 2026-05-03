#!/bin/bash

# Phase 1: Hadoop Cluster Validation

echo "Step 1: Verify Hadoop Daemons"
jps

echo "Step 2: Test HDFS Read/Write"

# Remove old test directory if exists
hdfs dfs -rm -r /test_dir 2>/dev/null

# Create directory in HDFS
hdfs dfs -mkdir /test_dir

# Create sample file locally
echo "hello hadoop" > sample.txt

# Upload file to HDFS
hdfs dfs -put sample.txt /test_dir/

# Read file from HDFS
hdfs dfs -cat /test_dir/sample.txt

echo "Step 3: Run MapReduce Job"

# Remove old output if exists
hdfs dfs -rm -r /output 2>/dev/null

# Run WordCount example
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar wordcount /test_dir /output

echo "Step 4: Check Output"
hdfs dfs -cat /output/part-r-00000

echo "Step 5: Validation Completed"

