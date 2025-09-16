FROM archlinux:latest

# Install base + full XFCE desktop + VNC + Wine
RUN pacman -Syu --noconfirm archlinux-keyring && \
    pacman-key --init && \
    pacman-key --populate archlinux && \
    echo "[multilib]" >> /etc/pacman.conf && \
    echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf && \
    pacman -Syu --noconfirm \
        base \
        base-devel \
        xorg-server-xvfb \
        xorg-xinit \
        x11vnc \
        xfce4 \
        xfce4-goodies \
        xfce4-terminal \
        thunar \
        gvfs \
        dbus \
        wine-staging \
        wget \
        unzip \
        tar \
        git \
        nano \
        xorg-fonts-misc \
        terminus-font \
        ttf-dejavu \
        ttf-liberation && \
    rm -rf /var/cache/pacman/pkg/*

# Create non-root user
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} fsuser && \
    useradd -m -u ${UID} -g ${GID} fsuser

# Initialize dbus machine-id and prepare runtime dir for the user
RUN dbus-uuidgen > /etc/machine-id && \
    mkdir -p /run/dbus && \
    chown fsuser:fsuser /run/dbus

# Copy startup script
COPY start-vnc.sh /usr/local/bin/start-vnc.sh
RUN chmod +x /usr/local/bin/start-vnc.sh

USER fsuser
WORKDIR /home/fsuser

EXPOSE 5900

CMD ["/usr/local/bin/start-vnc.sh"]

