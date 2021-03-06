FROM consol/ubuntu-xfce-vnc
USER 0
RUN apt-get -y update && apt-get install -y curl  zip unzip net-tools inetutils-ping iproute2 sudo lsb-core  \
&& echo 'root:root@1234' |chpasswd && dd if=/dev/zero of=/root/swapfile bs=1M count=1k && chmod 600 /root/swapfile \
&& mkswap /root/swapfile && swapon /root/swapfile

EXPOSE 6901
