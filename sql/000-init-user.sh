#!/bin/bash
set -e
# todo: zrobic prune i sprawdzic baze postgres

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER docker WITH ENCRYPTED PASSWORD 'docker';
    CREATE DATABASE docker;
    GRANT ALL PRIVILEGES ON DATABASE docker TO docker;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname docker -f /docker-entrypoint-initdb.d/001-init.sql
