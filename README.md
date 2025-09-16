# arch-vnc-wine
An Arch Linux container with **VNC remote desktop, XFCE, and Wine**. This setup provides a lightweight but complete desktop environment for running Windows applications inside Docker, accessible over VNC.

## ✨ Features
- Based on **Arch Linux (latest)**
- **Wine Staging** for running Windows applications
- Full **XFCE desktop environment** (panel, menu, file manager, terminal)
- **Xvfb + x11vnc** for headless VNC access
- **Non-root user (fsuser)** for security
- Easy to extend with additional tools or Windows apps

## 🚀 Usage
1. Clone the repository  
   ```bash
   git clone https://github.com/jay21442/arch-vnc-wine.git
   cd arch-vnc-wine
Build and start with Docker Compose

bash
Copy code
docker compose up -d --build
The container will start a VNC server on port 5900.

📂 Volumes
Two directories can be mounted into the container:

./installer → /home/fsuser/installer (place Windows installers here)

./dlc → /home/fsuser/dlc (useful for game data, mods, or other external files)

To create them:

bash
Copy code
mkdir installer dlc
These directories will appear inside the container under /home/fsuser/.

🔑 Connect via VNC
Use any VNC client and connect to:

makefile
Copy code
localhost:5900
Default desktop: XFCE (includes menu, terminal, file manager).

🛠 Development Notes
Runs as non-root user: fsuser

start-vnc.sh handles Xvfb, dbus, XFCE, and VNC startup

Designed as a functional base; extend it for specific apps (e.g. games, tools)

📜 License
This project is licensed under the MIT License (LICENSE).

yaml
Copy code

---

Do you want me to also include a **git command block** (all-in-one) that stages, commits, and pushes this updated
