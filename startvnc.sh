#!/bin/bash

echo "$X11VNC_PASSWORD" | vncpasswd -f > ~/.vnc/passwd
chmod 600 ~/.vnc/passwd

vncserver -rfbport 5900 -geometry 1200x800

PID=$(cat ~/.vnc/*.pid)
while [ -e /proc/$PID ]; do sleep 1; done
