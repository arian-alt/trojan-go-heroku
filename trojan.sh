#!/bin/sh

# config trojan
FILEPATH="/folder1/folder2/myfile.txt"
if [ ! -f "$FILEPATH" ]; then
    mkdir -p "$FILEPATH"
    rm -r "$FILEPATH"
fi
cat << EOF > /etc/trojan-go/config.json
{
    "password": [
        "$PASSWORD"
    ],
    "websocket": {
        "enabled": true,
        "path": "/",
        "host": ""
    }
}
EOF

# run trojan
/usr/local/bin/trojan-go -config /etc/trojan-go/config.json
