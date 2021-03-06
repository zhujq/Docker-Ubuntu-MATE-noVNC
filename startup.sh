#!/bin/bash

if [ ! -f /root/.vnc/passwd ] ; then

    
    PASSWORD=ubuntu
    echo "root:$PASSWORD" | chpasswd

    # Set up vncserver
    su $USER -c "mkdir /root/.vnc && echo '$PASSWORD' | vncpasswd -f > /root/.vnc/passwd && chmod 600 /root/.vnc/passwd && touch /root/.Xresources"
    
       
else

    VNC_PID=`find /root/.vnc -name '*.pid'`
    if [ ! -z "$VNC_PID" ] ; then
        vncserver -kill :1
        rm -rf /tmp/.X1*
    fi

fi

/usr/bin/supervisord -n
