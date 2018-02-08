newsnowio/pg_dump
================

Docker image with pg_dump

### Usage

#### Dump database

Run backup use "mybackup" as backup file prefix, shell will ask for password:

    docker run -ti --rm \
        -v $(pwd):/dump \                   # where to put db dumps
        -e PGDATABASE=mybackup \            # application database instance identifier
        -e PGHOST=pghost \                  # database hostname 
        -e PGUSER=dbadmin \
        newsnowio/pg_dump:9.4 dump          # make sure you run with same postgresql version

#### Restore database

Restore to "mybackup", shell will ask for password:

    docker run -ti --rm \
        -v $(pwd):/dump \                   # where to put db dumps
        -e PGDATABASE=mybackup \            # application database instance identifier
        -e PGHOST=pghost \                  # database hostname
        -e PGUSER=dbadmin \
        -e FILE=mybackup-20180206 \ 
        newsnowio/pg_dump:9.4 restore       # make sure you run with same postgresql version

### Buid images

Build images for different postresql version.

    # make sure you have login hub.docker.io
    docker login -u newsnowio

    # run the script to build and push images for most popular postresql version.
    ./build.sh
