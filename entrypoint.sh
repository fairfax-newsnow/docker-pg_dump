#!/bin/bash

set -e

PREFIX=${PGDATABASE}
PGUSER=${PGUSER:-dbadmin}

echo "Job started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/dump/$PGHOST/$PREFIX-$DATE.sql"
mkdir -p /dump/$PGHOST/

pg_dump -h "${PGHOST}" -U "${PGUSER}" -d ${PGDATABASE} -f "$FILE"
gzip "$FILE"

echo "Job finished: $(date)"
