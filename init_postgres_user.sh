#!/bin/bash
set -e

if test "$PASSWORD" = ""; then
  echo "usage: PASSWORD=xxxx  $0"
  exit 1
fi

ROLE="$USER"

#sudo su - postgres psql << EOF
sudo -u postgres psql << EOF
CREATE ROLE "$ROLE"
  WITH LOGIN PASSWORD '$PASSWORD'
  NOSUPERUSER INHERIT CREATEROLE;

CREATE DATABASE "$ROLE"
  WITH OWNER = "$ROLE"
  ENCODING = 'UTF8'
  TABLESPACE = pg_default
  CONNECTION LIMIT = -1;
EOF
