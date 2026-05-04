#!/bin/bash

# Phase 3 - Task 4: Built-in WordCount Execution

echo "Step 1: Check input data in HDFS"
hdfs dfs -ls /logs

echo "Step 2: Remove old output (if exists)"
hdfs dfs -rm -r /output 2>/dev/null

echo "Step 3: Run WordCount MapReduce Job"
hadoop jar $HADOOP_HOME/share/hadoop/mapreduce/hadoop-mapreduce-examples-*.jar wordcount /logs /output

echo "Step 4: Check output in HDFS"
hdfs dfs -ls /output

echo "Step 5: Display sample output"
hdfs dfs -cat /output/part-r-00000 | head

echo "Phase 3 Completed"
