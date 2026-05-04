#!/bin/bash

# Phase 2 - Task 3: Large Log File Scalability Test

echo "Step 1: Check HDFS Block Size"
hdfs getconf -confKey dfs.blocksize

echo "Step 2: Generate Large Log File (~1GB)"

# Generate large log file
yes '127.0.0.1 - - [10/Oct/2023:13:55:36 +0000] "GET /home HTTP/1.1" 200 2326 "-" "Mozilla"' | head -n 10000000 > biglog.log

echo "Step 3: Verify File Size"
ls -lh biglog.log

echo "Step 4: Upload File to HDFS"

# Create logs directory if not exists
hdfs dfs -mkdir -p /logs

# Remove old file if exists
hdfs dfs -rm /logs/biglog.log 2>/dev/null

# Upload file
hdfs dfs -put biglog.log /logs/

echo "Step 5: Check Block Information"
hdfs fsck /logs/biglog.log -files -blocks

echo "Task 3 Completed"

