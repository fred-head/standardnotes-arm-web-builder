#!/bin/sh

set -e

DEFAULT_SYNC_SERVER="${DEFAULT_SYNC_SERVER:-https://api.standardnotes.com}"

echo "Using sync server: ${DEFAULT_SYNC_SERVER}"

sed -i \
  "s|__DEFAULT_SYNC_SERVER__|${DEFAULT_SYNC_SERVER}|g" \
  /usr/share/nginx/html/index.html

exec nginx -g "daemon off;"
