#!/usr/bin/env bash

set -e

echo "$(basename $0) >> Running"

# Make .strider ephemeral. Link to /tmp to use local host io.
if [ ! -L "/data/.strider" ]; then
    echo "$(basename $0) >> Adding symlink for /tmp/strider"
    rm -rf /data/.strider
    ln -s /data/.strider /tmp/strider
fi

echo "Running /entry.sh $@"
/entry.sh "$@"