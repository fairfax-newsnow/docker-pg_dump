FROM postgres:10

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /dump

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
