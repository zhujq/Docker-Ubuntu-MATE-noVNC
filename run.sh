  
#!/bin/bash
export DISPLAY=:1
Xvfb :1 -screen 0 $SCREEN_SIZE &
sleep 5

openbox-session &
sleep 2

x11vnc -storepasswd $PASSWORD ~/.vnc/passwd

x11vnc -usepw -display :1 -forever -bg -ncache 10 -rfbport 5901 &
cd ~/noVNC && ./utils/launch.sh --listen 8080 --vnc localhost:5901