#!/bin/sh
# If docker is not running replace the 0 with a cross
response=$(docker ps -f status="running" 2>/dev/null)
if [ -z "$response" ]; then
  echo "."; exit 1
else
    let "RESULT =$(echo "$response" | wc -l) - 1"; echo $RESULT; exit 0
fi
