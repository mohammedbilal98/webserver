#!/bin/bash

# Script to automate the backup of system_health_monitor.log to AWS S3 bucket

SOURCE_DIR="/home/ubuntu/system_health_monitor.log"  
Backup_DIR="/home/ubuntu/backup/backup_system_health_monitor.log"  
LOG_FILE="/home/ubuntu/backup/backup_log.txt"  


timestamp=$(date +"%Y-%m-%d %H:%M:%S")

echo $timestamp: Starting backup of $SOURCE_DIR to $Backup_DIR >> $LOG_FILE

# Perform the backup using aws s3 cp
if   cp $SOURCE_DIR $Backup_DIR  --recursive >> $LOG_FILE ; then
    echo "$timestamp: Backup successful" >> $LOG_FILE
else
   echo "$timestamp: Backup failed" >> "$LOG_FILE"
fi