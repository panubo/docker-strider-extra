#!/usr/bin/env bash

set -e

[ "$DEBUG" == 'true' ] && set -x

echo "$(basename $0) >> Running BUILD $BUILD"

# Make .strider ephemeral. Link to /tmp to use local host io.
if [ ! -L "/data/.strider" ]; then
    echo "$(basename $0) >> Adding symlink for /tmp/strider"
    rm -rf /data/.strider
    cd /data && ln -s /tmp/strider/ .strider
fi

# Allow strider user to run docker commands
[ -S "/var/run/docker.sock" ] && sudo chmod o+rw /var/run/docker.sock

echo "Exec'ing /entry.sh $@"
exec /usr/bin/env bash /entry.sh "$@"
