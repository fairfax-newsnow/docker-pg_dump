#!/bin/bash

echo "Job started: $(date)"

# pg_restore options.
#   -v, --verbose            verbose mode
#   -c, --clean              clean (drop) database objects before recreating
#   -x, --no-privileges      do not dump privileges (grant/revoke)
#   -O, --no-owner           skip restoration of object ownership in
PGOPTION="-v --clean --no-privileges --no-owner"

echo "pg_restore -h ${PGHOST} -U ${PGUSER} -d ${PGDATABASE} ${PGOPTION} /dump/${FILE}"
pg_restore -h ${PGHOST} -U ${PGUSER} -d ${PGDATABASE} ${PGOPTION} /dump/${FILE}

echo "Database restore has been completed: $(date)"
