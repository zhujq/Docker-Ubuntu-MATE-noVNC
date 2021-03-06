FROM consol/ubuntu-xfce-vnc
USER 0
RUN apt-get -y update && apt-get install -y curl  zip unzip net-tools inetutils-ping iproute2 sudo lsb-core  \
&& echo 'root:root@1234' |chpasswd


EXPOSE 6901
