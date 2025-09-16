#!/bin/sh
# Start virtual framebuffer
Xvfb :0 -screen 0 1024x768x16 &

# Give it a moment
sleep 2

# Start Fluxbox
fluxbox -display :0 &

# Start an xterm for debugging
xterm -display :0 &

# Start VNC server
x11vnc -display :0 -nopw -listen 0.0.0.0 -xkb -forever
