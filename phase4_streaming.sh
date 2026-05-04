#!/bin/bash

# Phase 4 - Python MapReduce using Hadoop Streaming

echo "Step 1: Check input data in HDFS"
hdfs dfs -ls /logs

echo "Step 2: Remove old output (if exists)"
hdfs dfs -rm -r /pyoutput 2>/dev/null

echo "Step 3: Run Hadoop Streaming Job"

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-input /logs \
-output /pyoutput \
-mapper "python3 mapper.py" \
-reducer "python3 reducer.py"

echo "Step 4: Check output directory"
hdfs dfs -ls /pyoutput

echo "Step 5: Display sample output"
hdfs dfs -cat /pyoutput/part-00000 | head

echo "Phase 4 Completed"

