#!/bin/sh
export SPARQL_ENDPOINT=http://localhost:8891/sparql
export ISQL_PORT=1112
export ISQL_USER=dba
export ISQL_PASSWORD=secret
export OUTPUT_DIR=/var/local/scoreboardtest/download
./export_datasets.py
