FROM archlinux:latest

# Install dependencies
RUN pacman -Syu --noconfirm archlinux-keyring \
    && pacman-key --init \
    && pacman-key --populate archlinux \
    && echo "[multilib]" >> /etc/pacman.conf \
    && echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf \
    && pacman -Syu --noconfirm \
       wine-staging \
       xorg-server-xvfb \
       x11vnc \
       fluxbox \
       xterm \
       wget \
       unzip \
       tar \
       git \
       base-devel \
       xorg-fonts-misc \
       terminus-font \
       ttf-dejavu \
       ttf-liberation \
    && rm -rf /var/cache/pacman/pkg/*

# Create non-root user
ARG UID=1000
ARG GID=1000
RUN groupadd -g ${GID} fsuser \
    && useradd -m -u ${UID} -g ${GID} fsuser

# Copy startup script as root, fix permissions
COPY start-vnc.sh /usr/local/bin/start-vnc.sh
RUN chmod +x /usr/local/bin/start-vnc.sh

# Switch to non-root
USER fsuser
WORKDIR /home/fsuser

# Expose VNC
EXPOSE 5900

# Run VNC startup
CMD ["/usr/local/bin/start-vnc.sh"]
