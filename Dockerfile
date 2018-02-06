FROM postgres:9.4

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /dump

ENTRYPOINT ["/entrypoint.sh"]
CMD [""]
