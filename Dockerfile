FROM mysql:8

COPY ./init ./docker-entrypoint-initdb.d

ENV MYSQL_ROOT_PASSWORD=spaces
ENV MYSQL_DATABASE=contosodb
ENV MYSQL_USER=contoso
ENV MYSQL_PASSWORD=spaces

EXPOSE 3306 33060

CMD ["mysqld"]