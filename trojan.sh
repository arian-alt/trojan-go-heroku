#!/bin/sh

# config trojan
FILEPATH="/etc/trojan-go/config.json"
if [ ! -f "$FILEPATH" ]; then
    mkdir -p "$FILEPATH"
    rm -r "$FILEPATH"
fi
cat << EOF > /etc/trojan-go/config.json
{
    "run_type": "server",
    "local_addr": "0.0.0.0",
    "local_port": $PORT,
    "remote_addr": "google.com",
    "remote_port": 80,
    "password": [
        "$PASSWORD"
    ]
}
EOF

# run trojan
/usr/local/bin/trojan-go -config /etc/trojan-go/config.json
