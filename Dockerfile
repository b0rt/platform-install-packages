FROM centos/systemd
ENV container docker
ENV PHP_VERSION="72"
# is this line needed?
#RUN echo "NETWORKING=yes" > /etc/sysconfig/network

RUN rpm --import https://www.centos.org/keys/RPM-GPG-KEY-CentOS-7 && \
 yum install -y postfix yum-utils
# why is this line in the original dockerfile? @todo
#RUN sed -i 's@^inet_protocols = all@inet_protocol = ipv4@g' /etc/postfix/main.cf

# EPEL REPO
# rpm -i (--install) -h (--hash) -v (verbose)
RUN rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 && \
 rpm -ihv  https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# mysql REPO for myslq 5.5
RUN rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql && \
 rpm -ihv  http://repo.mysql.com/yum/mysql-5.5-community/el/7/x86_64/mysql-community-release-el7-5.noarch.rpm && \
 yum install -y mysql-community-server



# REMI REPO FOR php
# 7.2 is recomended for stability as the php7.4 port is fresh
RUN rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi && \
 rpm -ihv https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN if [ ${PHP_VERSION} = "74" ]; then \
 yum-config-manager --enable remi-php74 \
 else \
 yum-config-manager --enable remi-php72 \
 ;fi

RUN useradd -ms /bin/bash kaltura && \
 useradd -ms /bin/bash elasticsearch

RUN rpm --import http://installrepo.kaltura.org/releases/RPM-GPG-KEY-kaltura-curr && \
 rpm -ihv http://installrepo.kaltura.org/releases/kaltura-release.noarch.rpm && \
 yum install -y kaltura-server

# optional
RUN yum update -y

ADD docker/install/* /root/install/
RUN chmod +x /root/install/install.sh

EXPOSE 80 443 1935 88 8443
CMD ["/sbin/init"]