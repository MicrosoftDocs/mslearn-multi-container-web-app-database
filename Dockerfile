FROM mysql:8 AS build

COPY ./init ./docker-entrypoint-initdb.d

RUN ["sed", "-i", "s/exec \"$@\"/echo \"not running $@\"/", "/usr/local/bin/docker-entrypoint.sh"]

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=contosodb
ENV MYSQL_USER=contoso
ENV MYSQL_PASSWORD=spaces

RUN ["/usr/local/bin/docker-entrypoint.sh", "mysqld", "--datadir", "/tmp"]

FROM mysql:8

COPY --from=build /tmp /var/lib/mysql

EXPOSE 3306 33060

CMD ["mysqld"]