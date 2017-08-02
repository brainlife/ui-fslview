#!/bin/bash

echo "-----------------------------------Xvfb-------------------------------"
Xvfb :0 -screen 0 1200x800x16 +extension RANDR +extension GLX &

echo "Waiting for Xvfb to be ready..."
while ! xdpyinfo -display :0; do
    echo -n ''
    sleep 0.2
done

echo "-----------------------------------lxde-----------------------------"
#I think I need to start the lxde before I can start x11?
DISPLAY=:0 startlxde &

echo "-----------------------------------x11vnc-----------------------------"
#TODO - -xrandr displays "Disabling -xrandr mode: display does not support X RANDR."
#I think something needs to be compiled into x11vnc for it to work?
x11vnc -forever -display :0 -passwd -ncache_cr $X11VNC_PASSWORD


