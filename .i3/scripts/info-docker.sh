#!/bin/sh

echo "$(docker ps -qf status="running" 2>/dev/null | wc -l)"
