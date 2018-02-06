#!/bin/bash

set -e

PGUSER=${PGUSER:-dbadmin}

echo "Job started: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/dump/${PGHOST}-${PGDATABASE}-${DATE}.sql"

pg_dump -h "${PGHOST}" -U "${PGUSER}" -d ${PGDATABASE} -f "${FILE}"
gzip "${FILE}"

echo "Job finished: $(date)"
