FROM postgres:10

ADD entrypoint.sh /entrypoint.sh
ADD dump.sh /dump.sh
ADD restore.sh /restore.sh

RUN chmod +x /entrypoint.sh /dump.sh /restore.sh

VOLUME /dump

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
