FROM centos:8


RUN echo "NETWORKING=yes" > /etc/sysconfig/network


# mysql (skipping as i plan to have mysql as extra service)
#RUN yum install -y mysql mysql-server
#RUN mysql_install_db
#RUN chkconfig mysqld on
#RUN service mysqld start


# facilities
# centos 8 ships with chronyd (replacing ntp)
RUN yum install -y postfix chrony wget dnf-plugins-core yum-utils
RUN chkconfig postfix on
RUN chkconfig chronyd on
RUN sed -i 's@^inet_protocols = all@inet_protocol = ipv4@g' /etc/postfix/main.cf
RUN systemctl enable postfix
RUN systemctl enable chronyd

# EPEL REPO
RUN dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y

# FUSION REPO
RUN dnf install https://download1.rpmfusion.org/free/el/rpmfusion-free-release-8.noarch.rpm -y

# REMI REPO FOR php
RUN dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
RUN dnf module reset php

# 7.2 is recomended for stability as the php7.4 port is fresh
RUN dnf module install php:remi-7.2 -y

# kaltura
RUN dnf install http://installrepo.kaltura.org/releases/kaltura-release.noarch.rpm -y
# kaltura-server requires kaltura-front which requires kaltura-sshpass
# for now kaltura-sshpass ist not present in noarch path http://installrepo.kaltura.org/releases/16.15.0/8/noarch/
# therefore we are installing it manually
RUN dnf install http://installrepo.kaltura.org/releases/16.15.0/8/x86_64/kaltura-sshpass-1.06-1.x86_64.rpm -y
# kalutra-server requres kaltura-dwh which requires kaltura-pentaho
# for now kaltura-pentaho in not present in noarch path http://installrepo.kaltura.org/releases/16.15.0/8/noarch/
# therefore we are installing it manually
RUN dnf install http://installrepo.kaltura.org/releases/16.15.0/8/x86_64/kaltura-pentaho-4.2.1-2.x86_64.rpm -y

# update everything to be current
#RUN yum config-manager --set-enabled powertools
RUN yum update -y

# during installation of kaltura-server the output suggest
# it was expecting a user named 'kaltura', so we are creating one
RUN useradd -ms /bin/bash kaltura
RUN yum install -y kaltura-server

ADD docker/install/* /root/install/
RUN chmod +x /root/install/install.sh

EXPOSE 80 443 1935 88 8443


# start services
CMD ["/sbin/init"]