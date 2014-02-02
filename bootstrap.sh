#!/bin/bash
# Install Docker on CentOS/RHEL

# Ensure that we have EPEL availiable
rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm

# Upgrade our critical system components (we could do everthing here, but it takes a while)
yum -y upgrade kernel

# Install Docker. The version in EPEL-testing is normally much more in line
# with docker.io so install the base EPEL version then attempt to upgrade from
# testing
yum -y install docker-io
yum --enablerepo=epel-testing -y upgrade docker-io

# Make sure that our Vagrant user is able to run Docker
usermod -a -G docker vagrant

# Enable Docker at boot
/sbin/chkconfig docker on

# Reboot, the chances are we've had a kernel upgrade...
reboot
