#!/bin/bash

set -e

COMMAND=${1:-dump}
PREFIX=${PREFIX:-dump}
PGUSER=${PGUSER:-dbadmin}

echo "Job started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/dump/$PGHOST/$PREFIX-$DATE.sql"
mkdir -p /dump/$PGHOST/

pg_dump -h "$PGHOST" -U "$PGUSER" -f "$FILE"
gzip "$FILE"

echo "Job finished: $(date)"
