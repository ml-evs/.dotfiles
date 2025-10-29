#!/bin/bash

# Wait up to 30 seconds for keyring to be available
for i in {1..30}; do
    BW_SESSION=$(secret-tool lookup user matthew@datalab.industries domain bitwarden.com | bw unlock --raw)
    if [ -n "$BW_SESSION" ]; then
        echo "export BW_SESSION='$BW_SESSION'" > ~/.bw-session
        exit 0
    fi
    sleep 1
done

echo "Keyring not available after 30 seconds" >&2
exit 1
