FROM postgres:12
ENV POSTGRES_DB peslac
ENV POSTGRES_PASSWORD postgrespassword
COPY backup-punto-hogar-peslac-202208022029.sql /docker-entrypoint-initdb.d/