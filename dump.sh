#!/bin/bash

echo "Job started: $(date)"

# pg_dump options.
#   -x, --no-privileges          do not dump privileges (grant/revoke)
#   -O, --no-owner               skip restoration of object ownership in 
#   -F, --format=c|d|t|p         output file format (custom, directory, tar,
#                              plain text (default))
PGOPTION="--no-owner --no-privileges -Fc"

DATE=$(date +%Y%m%d)
FILE="/dump/${PGHOST}-${PGDATABASE}-${DATE}"

echo "pg_dump -h ${PGHOST} -U ${PGUSER} -d ${PGDATABASE} ${PGOPTION} -f ${FILE}"
read -p "Press enter to continue"
pg_dump -h "${PGHOST}" -U "${PGUSER}" -d "${PGDATABASE}" ${PGOPTION} -f "${FILE}"

echo "Job finished: $(date)"
