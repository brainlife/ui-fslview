#from kaixhin/vnc

# Start with Ubuntu base image
FROM ubuntu:14.04
MAINTAINER Soichi Hayashis <hayashis@iu.edu>

# Install LXDE, VNC server, XRDP
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
   xvfb x11vnc vim \
   lxde-core lxde-icon-theme lxterminal

# Set user for VNC server (USER is only for build)
#ENV USER root
## Set default password
#COPY password.txt .
#RUN cat password.txt password.txt | vncpasswd && \
#  rm password.txt
## Expose VNC port
#EXPOSE 5901

EXPOSE 5900

# Set XDRP to use TightVNC port
#RUN sed -i '0,/port=-1/{s/port=-1/port=5901/}' /etc/xrdp/xrdp.ini

#install fslview
RUN \
	echo "deb http://neuro.debian.net/debian data main" >> /etc/apt/sources.list.d/neurodebian.sources.list && \
	echo "deb http://neuro.debian.net/debian trusty main" >> /etc/apt/sources.list.d/neurodebian.sources.list && \
	apt-key adv --recv-keys --keyserver hkp://pgp.mit.edu:80 0xA5D32F012649A5A9 && \
	apt-get update && apt-get install -y fslview

# Copy VNC script that handles restarts
ADD vnc.sh /opt
CMD ["/opt/vnc.sh"]

# Install autostart file for fslview
RUN mkdir -p /root/.config/autostart
ADD start.sh /
ADD start.desktop /root/.config/autostart

