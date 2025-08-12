#!/bin/bash
set -e

# DBが起動するまで待機
until pg_isready -h db -p 5432 -U postgres > /dev/null 2>&1; do
  echo "Waiting for Postgres..."
  sleep 1
done

exec "$@"
