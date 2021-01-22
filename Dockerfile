FROM centos/systemd

MAINTAINER "Stephan Deglow" <stephandeglow@gmail.com>
ENV container docker

RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# mysql (skipping as i plan to have mysql as extra service)
#RUN yum install -y mariadb-server
#RUN mysql_install_db
#RUN chkconfig mysqld on
#RUN service mysqld start

# facilities
# centos 8 ships with chronyd (replacing ntp)
RUN yum install -y postfix chrony wget dnf dnf-plugins-core yum-utils httpd systemd git
RUN yum install openssl-devel -y
RUN yum group install "Development Tools" -y
RUN chkconfig postfix on
RUN chkconfig chronyd on
RUN sed -i 's@^inet_protocols = all@inet_protocol = ipv4@g' /etc/postfix/main.cf
RUN systemctl enable postfix
RUN systemctl enable chronyd

# EPEL REPO
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y

# FUSION REPO
#RUN dnf install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm -y

# REMI REPO FOR php
RUN dnf install https://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
#RUN dnf module reset php

# 7.2 is recomended for stability as the php7.4 port is fresh
# RUN dnf module install remi-php72
RUN yum-config-manager --enable remi-php72
#RUN yum-config-manager --enable remi-php72

#RUN yum update -y
# kaltura
RUN dnf install http://installrepo.kaltura.org/releases/kaltura-release.noarch.rpm -y
# kaltura-server requires kaltura-front which requires kaltura-sshpass
# for now kaltura-sshpass ist not present in noarch path http://installrepo.kaltura.org/releases/16.15.0/8/noarch/
# therefore we are installing it manually
RUN dnf install http://installrepo.kaltura.org/releases/16.15.0/8/x86_64/kaltura-sshpass-1.06-1.x86_64.rpm -y
# kalutra-server requres kaltura-dwh which requires kaltura-pentaho
# for now kaltura-pentaho in not present in noarch path http://installrepo.kaltura.org/releases/16.15.0/8/noarch/
# therefore we are installing it manually
# during installation of kaltura-pentaho the output suggest
# it was expecting a user named 'kaltura', so we are creating one
RUN useradd -ms /bin/bash kaltura

#RUN git clone https://github.com/percona/percona-server.git
#RUN cd percona-server
#RUN git checkout 5.5
#RUN cmake .
#RUN make dist

RUN wget https://github.com/Kitware/CMake/releases/download/v3.17.3/cmake-3.17.3.tar.gz
# build cmake https://www.osradar.com/how-to-install-cmake-on-centos-8/
# build percona https://www.percona.com/doc/percona-server/5.5/installation.html#installing-percona-server-from-a-source-tarball
RUN yum install libaio-devel ncurses-devel -y

# git clone https://github.com/percona/percona-server.git --single-branch --branch 5.5
# cd percona-server
# cmake .
# make dist
#RUN git clone https://github.com/percona/percona-server.git --single-branch --branch 5.5
#RUN cd percona-server
#RUN cmake .
#RUN make dist
RUN dnf install http://installrepo.kaltura.org/releases/16.15.0/8/x86_64/kaltura-pentaho-4.2.1-2.x86_64.rpm -y

# update everything to be current
#RUN yum config-manager --set-enabled powertools

RUN yum install -y kaltura-ffmpeg --skip-broken
#RUN yum install -y kaltura-server

ADD docker/install/* /root/install/
RUN chmod +x /root/install/install.sh


# based on https://hub.docker.com/_/centos
#RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
#systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#rm -f /lib/systemd/system/multi-user.target.wants/*;\
#rm -f /etc/systemd/system/*.wants/*;\
#rm -f /lib/systemd/system/local-fs.target.wants/*; \
#rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#rm -f /lib/systemd/system/basic.target.wants/*;\
#rm -f /lib/systemd/system/anaconda.target.wants/*;
#VOLUME [ "/sys/fs/cgroup" ]

# start services
RUN systemctl enable httpd.service

EXPOSE 80 443 1935 88 8443
CMD ["/sbin/init"]