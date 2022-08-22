#!/bin/bash

set -eo pipefail

base_filename="${POSTGRES_DB}_backup_`date +%Y_%m_%d__%H_%M_%S`"


PGPASSWORD="${POSTGRES_PASS}" pg_dump  -U "${POSTGRES_USER}"  -h "${POSTGRES_HOST}" "${POSTGRES_DB}" | gzip -9  > "/tmp/${base_filename}.sql.gz"

# rclone config is a file, create it and label remote as gdrive
mkdir -p /config/rclone
printf "[gdrive]\ntype = drive\nclient_id = \nclient_secret = \n" > /config/rclone/rclone.conf
echo "token = ${RCLONE_TOKEN}" >> /config/rclone/rclone.conf

rclone -vv --size-only copy "/tmp/${base_filename}.sql.gz" gdrive:"${DEST_DIR}"

# clean up
rm -f "/tmp/${base_filename}.sql.gz"


