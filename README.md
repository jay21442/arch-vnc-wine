cat > README.md << 'EOF'
# arch-vnc-wine

A minimal Arch Linux container with VNC, Fluxbox, and Wine.  
This setup is useful for running Windows applications in a lightweight virtualized environment with VNC remote access.

## Features
- Based on Arch Linux (latest)
- Wine Staging for running Windows applications
- Fluxbox window manager
- Xvfb + x11vnc for headless VNC access
- Easy-to-extend with additional tools

## Usage

### 1. Clone the repository
git clone https://github.com/jay21442/arch-vnc-wine.git
cd arch-vnc-wine

### 2. Build and start with Docker Compose
docker compose up -d --build

The container will start a VNC server on port 5900.

## Volumes

Two directories are mounted into the container:

- ./installer → /home/fsuser/installer  
  Place installers for Windows applications here.

- ./dlc → /home/fsuser/dlc  
  Useful for game data, mods, or other external files.

To create them:
mkdir installer dlc

These directories will be available inside the container under /home/fsuser/.

## Connect via VNC

Use any VNC client and connect to:
localhost:5900

Default window manager: Fluxbox

## Development Notes
- The container runs as a non-root user (fsuser)
- start-vnc.sh handles the Xvfb, Fluxbox, and VNC startup
- Designed as a minimal base; extend it for specific applications

## License
This project is licensed under the MIT License (LICENSE).
EOF
