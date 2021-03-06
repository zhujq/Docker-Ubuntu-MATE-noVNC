FROM ubuntu:18.04

ADD run.sh /run.sh

RUN  apt-get -y update && DEBIAN_FRONTEND=noninteractive apt-get install -y  git curl  zip unzip net-tools inetutils-ping iproute2 lubuntu-desktop  tightvncserver  \  
&& mkdir -p /var/run/sshd \
&& echo 'root:root@1234' |chpasswd  \
&& mkdir /root/.ssh \
&& apt-get purge --auto-remove -y curl  \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /root/
COPY xstartup /root/.vnc/
RUN mkdir -p /root/.vnc && chmod a+x /root/.vnc/xstartup && touch /root/.vnc/passwd \
&& /bin/bash -c "echo -e 'password\npassword\nn' | vncpasswd" > /root/.vnc/passwd \
&& chmod 400 /root/.vnc/passwd && chmod go-rwx /root/.vnc && touch /root/.Xauthority

# Clone noVNC.
RUN git clone https://github.com/novnc/noVNC.git  /root/noVNC

# Clone websockify for noVNC
Run git clone https://github.com/kanaka/websockify  /root/noVNC/utils/websockify


EXPOSE 8080
CMD ["/bin/bash", "/run.sh"]

