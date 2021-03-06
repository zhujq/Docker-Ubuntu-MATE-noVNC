#!/bin/bash
export USER=root
mkdir -p /var/run/sshd
nohup /usr/sbin/sshd -D &
nohup vncserver :1 -geometry 1920x1080 -depth 24 && tail -F /root/.vnc/*.log &
nohup /root/noVNC/utils/launch.sh --listen 8080 --vnc localhost:5901

dd if=/dev/zero of=/root/swapfile bs=1M count=1k
chmod 600 /root/swapfile
mkswap /root/swapfile
swapon /root/swapfile
