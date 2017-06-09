FROM starefossen/node-imagemagick

COPY docker-entrypoint.sh /var/

ENTRYPOINT ["/var/docker-entrypoint.sh"]
