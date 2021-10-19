#!/usr/bin/env sh

BACKUP_NAME="$(date -u +%Y-%m-%d_%H-%M-%S)_UTC.gz"

# Run backup

pg_dump -d $POSTGRESQL_URI > /backup/latest.dump

# Compress backup
cd /backup/ && tar -cvzf "${BACKUP_NAME}" latest.dump
# Upload backup
aws s3 cp "/backup/${BACKUP_NAME}" "s3://${S3_BUCKET}/${BACKUP_NAME}"
# Delete temp files
rm -rf /backup/latest.dump