FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV USER ubuntu
ENV HOME /home/$USER

# Create new user for vnc login.
RUN adduser $USER --disabled-password

# Install MATE and dependency component.
RUN apt-get update \
    && apt-get install -y \
        tightvncserver \
          mate-core mate-desktop-environment mate-notification-daemon wget net-tools curl chromium-browser openssh-client git \
        supervisor \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# Clone noVNC.
RUN git clone https://github.com/novnc/noVNC.git $HOME/noVNC

# Clone websockify for noVNC
Run git clone https://github.com/kanaka/websockify $HOME/noVNC/utils/websockify

# Copy supervisor config.
COPY supervisor.conf /etc/supervisor/conf.d/

# Copy startup script.
COPY startup.sh $HOME

EXPOSE 8080
CMD ["/bin/bash", "/home/ubuntu/startup.sh"]

