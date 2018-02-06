FROM postgres:latest

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

VOLUME /dump

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
