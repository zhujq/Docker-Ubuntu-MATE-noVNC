FROM ubuntu:16.04

ENV DEBIAN_FRONTEND noninteractive
ENV USER ubuntu
ENV HOME /home/$USER

RUN  adduser $USER --disabled-password \
&& apt-get -y update &&  apt-get install -y  git curl  zip unzip net-tools inetutils-ping iproute2 lubuntu-desktop  tightvncserver  \  
&& git clone https://github.com/novnc/noVNC.git  $HOME/noVNC \
&&  git clone https://github.com/kanaka/websockify  $HOME/noVNC/utils/websockify

COPY supervisor.conf /etc/supervisor/conf.d/
COPY startup.sh $HOME
EXPOSE 8080
CMD ["/bin/bash", "/home/ubuntu/startup.sh"]
