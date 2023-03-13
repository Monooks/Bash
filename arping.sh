#!/bin/bash
PREFIX="${1:-NOT_SET}"
INTERFACE="$2"
SUBNET="${3:-NOT}"
HOST="${4:-NON}"

trap 'echo "Ping exit (Ctrl-C)"; exit 1' 2

[[ "$PREFIX" = "NOT_SET" ]] && { echo "\$PREFIX must be passed as first positional argument"; exit 1; }

[[ "$SUBNET" = "NOT" ]] && { echo "\$SUBNET is not passed as third positional argument"; }
sleep 3
[[ "$HOST" = "NON" ]] && { echo "\$HOST is not passed as fourth positional argument"; }
sleep 3

if [[ -z "$INTERFACE" ]]; then
    echo "\$INTERFACE must be passed as second positional argument"
    exit 1
fi
if [[ $SUBNET =~ ^(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]{1,2})$ ]] && [[ $HOST =~ ^(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]{1,2})$ ]]; then
        echo "[*] IP : ${PREFIX}.${SUBNET}.${HOST}"
        arping -c 3 -i "$INTERFACE" "${PREFIX}.${SUBNET}.${HOST}" 2> /dev/null
elif [[ $SUBNET =~ ^(25[0-5]|2[0-4][0-9]|[0-1]?[0-9]{1,2})$ ]] && [[ "$HOST" = "NON" ]]; then
        for HOST in {1..255}
        do
                echo "[*] IP : ${PREFIX}.${SUBNET}.${HOST}"
                arping -c 3 -i "$INTERFACE" "${PREFIX}.${SUBNET}.${HOST}" 2> /dev/null
        done
else
for SUBNET in {0..255}
do
        for HOST in {1..255}
        do
                echo "[*] IP : ${PREFIX}.${SUBNET}.${HOST}"
                arping -c 3 -i "$INTERFACE" "${PREFIX}.${SUBNET}.${HOST}" 2> /dev/null
        done
done
fi
