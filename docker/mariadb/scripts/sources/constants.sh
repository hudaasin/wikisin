#!/bin/bash

# Set the backup directory path
BACKUP_DIR_PATH='/backups'
DATABASE_BACKUP_DIR_PATH="$BACKUP_DIR_PATH/database"

# Set the backup file prefix
DBMS_BACKUP_FILE_PREFIX='mariadb'  # Prefix for backup files containing data specifically from the database service, focusing on DBMS backups
DATA_BACKUP_FILE_PREFIX='database' # Prefix for backup files containing data from database services, focusing on individual database backups

# Set the backup file suffix
DBMS_BACKUP_FILE_SUFFIX="dbms"
DATA_BACKUP_FILE_SUFFIX='data'

# Define a pattern to match the database backup file name and extract the full database name
DATA_BACKUP_PATTERN="^([^_]+_db)_.*_data.sql.gz$"
