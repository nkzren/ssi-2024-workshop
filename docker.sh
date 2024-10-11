#!/bin/bash
docker run --rm -d --name workshop-ssi \
				-e POSTGRES_PASSWORD=banana \
				-e PGDATA=/var/lib/postgresql/data/pgdata \
				-v $PWD/dados:/var/lib/postgresql/data \
				-v $PWD/ddl.sql:/docker-entrypoint-initdb.d/ddl.sql \
				postgres:16
