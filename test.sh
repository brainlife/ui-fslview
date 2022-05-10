#!/bin/bash

echo "Starting VNC server"
docker rm -f test &> /dev/null || true

PASSWORD="${RANDOM}.${RANDOM}.${RANDOM}"
echo "Password: $PASSWORD"
CID=$(docker run -dP --name test -e X11VNC_PASSWORD=$PASSWORD -v `pwd`/test:/input:ro soichih/vncserver-fslview)
PORT=$(docker port $CID | cut -d " " -f 3 | head -n 1 | cut -d ":" -f 2)
echo "Container $CID using port $PORT"

# WEBSOCK_PORT=0.0.0.0:11000

# echo "------------------------------------------------------------------------"
# echo "http://dev1.soichi.us:11000/vnc_lite.html?password=$PASSWORD"
# echo "------------------------------------------------------------------------"

# /usr/local/noVNC/utils/launch.sh --listen $WEBSOCK_PORT --vnc $PORT

PASSWORD_ENC=$(echo "$PASSWORD" | docker run -i --rm soichih/vncserver-fslview vncpasswd -f)
echo $PASSWORD_ENC | vncviewer localhost:$PORT -passwd -
