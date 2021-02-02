FROM centos/systemd
ENV container docker
RUN echo "NETWORKING=yes" > /etc/sysconfig/network

RUN yum install -y postfix wget dnf dnf-plugins-core yum-utils
RUN chkconfig postfix on
# why is this line in the original dockerfile? @todo
#RUN sed -i 's@^inet_protocols = all@inet_protocol = ipv4@g' /etc/postfix/main.cf
RUN systemctl enable postfix

# EPEL REPO
RUN rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 && \
   dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y

# mysql REPO for myslq 5.5
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql && \
 dnf install http://repo.mysql.com/yum/mysql-5.5-community/el/7/x86_64/mysql-community-release-el7-5.noarch.rpm -y
RUN yum install -y mysql-community-server

# REMI REPO FOR php
RUN rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi && \
  rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi2017 && \
  rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi2018 && \
  rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi2019 && \
  rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi2020 && \
  dnf install https://rpms.remirepo.net/enterprise/remi-release-7.rpm -y

# 7.2 is recomended for stability as the php7.4 port is fresh
RUN yum-config-manager --enable remi-php72

RUN rpm --import http://installrepo.kaltura.org/releases/RPM-GPG-KEY-kaltura-curr && \
 dnf install http://installrepo.kaltura.org/releases/kaltura-release.noarch.rpm -y
RUN useradd -ms /bin/bash kaltura
RUN useradd -ms /bin/bash elasticsearch
RUN yum install -y kaltura-server

RUN yum update -y

ADD docker/install/* /root/install/
RUN chmod +x /root/install/install.sh

EXPOSE 80 443 1935 88 8443
CMD ["/sbin/init"]