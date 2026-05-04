#!/bin/bash

# Phase 5 - Error Log Analysis (Status >= 400)

echo "Step 1: Check input data"
hdfs dfs -ls /logs

echo "Step 2: Remove old output"
hdfs dfs -rm -r /error_output 2>/dev/null

echo "Step 3: Run Hadoop Streaming Job"

hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-*.jar \
-input /logs \
-output /error_output \
-mapper "python3 mapper_error.py" \
-reducer "python3 reducer_error.py"

echo "Step 4: Check output"
hdfs dfs -ls /error_output

echo "Step 5: Display results"
hdfs dfs -cat /error_output/part-00000 | head

echo "Phase 5 Completed"
