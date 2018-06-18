FROM postgres:9.5
MAINTAINER ingmapping <contact@ingmapping.com>

RUN apt-get update \
      && apt-get install -y --no-install-recommends --fix-missing \
                 postgresql-9.5-postgis-2.2 \
      && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh

EXPOSE 5432
