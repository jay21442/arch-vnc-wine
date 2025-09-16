#!/bin/sh
# Start virtual framebuffer
Xvfb :0 -screen 0 1280x800x24 -ac +extension GLX +render -noreset &

sleep 2
export DISPLAY=:0

# Ensure dbus machine-id exists
if [ ! -s /etc/machine-id ]; then
    dbus-uuidgen > /etc/machine-id
fi

# Ensure /run/dbus exists and is writable
mkdir -p /run/dbus
chown $(id -u):$(id -g) /run/dbus

# Start a dbus session for this user
eval $(dbus-launch --sh-syntax)
export DBUS_SESSION_BUS_ADDRESS
export DBUS_SESSION_BUS_PID

# Start XFCE desktop session
startxfce4 &

# Safety: start panel + desktop explicitly (in case XFCE session doesn’t autostart them)
xfce4-panel --disable-wm-check &
xfdesktop &

# Start VNC server
x11vnc -display :0 -nopw -listen 0.0.0.0 -xkb -forever

