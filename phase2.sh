#!/bin/bash

# Phase 2 - Task 2: Small File Analysis

echo "Uploading log file to HDFS"

hdfs dfs -mkdir -p /logs
hdfs dfs -put logfiles.log /logs/

echo "Checking file in HDFS"
hdfs dfs -ls /logs

echo "Checking block information"
hdfs fsck /logs/logfiles.log -files -blocks
