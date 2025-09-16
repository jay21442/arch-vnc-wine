# Dockerfile
FROM archlinux:latest

# Install required packages
RUN pacman -Sy --noconfirm \
    xorg-xvfb \
    x11vnc \
    fluxbox \
    xterm \
    tigervnc \
    wine \
    && pacman -Scc --noconfirm

# Create a user for VNC sessions
RUN useradd -m -s /bin/bash vncuser && \
    echo "vncuser:vncpassword" | chpasswd

USER vncuser
WORKDIR /home/vncuser

# Start VNC server when the container runs
CMD ["x11vnc", "-forever", "-usepw", "-create"]
