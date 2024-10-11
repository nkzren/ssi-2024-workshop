#!/bin/bash
docker run --rm -d --name workshop-ssi \
				-e POSTGRES_PASSWORD=banana \
				-e PGDATA=/var/lib/postgresql/data/pgdata \
				-v $PWD/dados:/var/lib/postgresql/data \
				-v $PWD/init_db.sql:/docker-entrypoint-initdb.d/init_db.sql \
				postgres:16
