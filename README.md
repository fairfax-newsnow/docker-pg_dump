newsnowio/pg_dump
================

Docker image with pg_dump

### Usage

Run backup use "mybackup" as backup file prefix, shell will ask for password:

    docker run -ti --rm \
        -v /path/to/target/folder:/dump \   # where to put db dumps
        -e PREFIX=mybackup \                # application database instance identifier
        -e PGHOST=pghost \                  # database hostname 
        -e PGUSER=dbadmin \
        newsnowio/pg_dump:9.4 dump          # make sure you run with same postgresql version
