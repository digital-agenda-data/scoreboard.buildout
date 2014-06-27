#!/bin/sh
export SPARQL_ENDPOINT=http://localhost:8890/sparql
export ISQL_PORT=1111
export ISQL_USER=dba
export ISQL_PASSWORD=secret
export OUTPUT_DIR=/var/local/scoreboard/download
./export_datasets.py
