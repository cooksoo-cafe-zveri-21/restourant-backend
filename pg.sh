#!/bin/bash

docker run -d -p 5432:5432 -e "POSTGRES_USER=dean" -e "POSTGRES_PASSWORD=dean" -e "POSTGRES_DB=pg_db" --name pg postgres