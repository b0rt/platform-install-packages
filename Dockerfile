FROM centos/systemd

MAINTAINER "Stephan Deglow" <stephandeglow@gmail.com>
ENV container docker

RUN echo "NETWORKING=yes" > /etc/sysconfig/network

# facilities
# centos 8 ships with chronyd (replacing ntp)
#RUN yum install -y postfix chrony wget dnf dnf-plugins-core yum-utils httpd
RUN yum install -y postfix wget dnf dnf-plugins-core yum-utils
RUN chkconfig postfix on
#RUN chkconfig chronyd on
#RUN sed -i 's@^inet_protocols = all@inet_protocol = ipv4@g' /etc/postfix/main.cf
RUN systemctl enable postfix
#RUN systemctl enable chronyd

# EPEL REPO
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -y

# FUSION REPO
#RUN dnf install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-7.noarch.rpm -y

# REMI REPO FOR php
RUN dnf install https://rpms.remirepo.net/enterprise/remi-release-7.rpm -y

# 7.2 is recomended for stability as the php7.4 port is fresh
# RUN dnf module install remi-php72
RUN yum-config-manager --enable remi-php72
#RUN yum-config-manager --enable remi-php72

RUN dnf install http://repo.mysql.com/yum/mysql-5.5-community/el/7/x86_64/mysql-community-release-el7-5.noarch.rpm -y
RUN yum install -y mysql-community-server

RUN yum update -y
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
RUN useradd -ms /bin/bash elasticsearch

RUN dnf install http://installrepo.kaltura.org/releases/16.15.0/8/x86_64/kaltura-pentaho-4.2.1-2.x86_64.rpm -y

RUN yum install -y kaltura-server

ADD docker/install/* /root/install/
RUN chmod +x /root/install/install.sh

EXPOSE 80 443 1935 88 8443
CMD ["/sbin/init"]