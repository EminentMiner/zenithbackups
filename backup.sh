#!/bin/bash

# Timestamp
TIMESTAMP=$(date +%F)

# Backup directory
BACKUP_DIR="/root/mongo_backups/Zenith_data_$TIMESTAMP"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Run mongodump for all databases with authentication
mongodump \
  --host localhost \
  --port 27017 \
  --username abdul \
  --password WSC7654ikn \
  --authenticationDatabase admin \
  --gzip \
  --archive="$BACKUP_DIR/mongo_backup.gz"

# Move to the main backup repo
cd /root/mongo_backups || exit

# Add, commit, and push new backup
git add "$BACKUP_DIR/mongo_backup.gz"
git commit -m "Backup on $TIMESTAMP"
git push origin main


