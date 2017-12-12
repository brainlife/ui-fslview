#from kaixhin/vnc

# Start with Ubuntu base image
#FROM ubuntu:14.04
FROM neurodebian:nd14.04
MAINTAINER Soichi Hayashis <hayashis@iu.edu>

# Install LXDE, VNC server, XRDP
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
   vim tightvncserver xfce4 

EXPOSE 5900

RUN apt-get install -y fslview

# Set XDRP to use TightVNC port
#RUN sed -i '0,/port=-1/{s/port=-1/port=5901/}' /etc/xrdp/xrdp.ini

#install fslview
#RUN \
#	echo "deb http://neuro.debian.net/debian data main" >> /etc/apt/sources.list.d/neurodebian.sources.list && \
#	echo "deb http://neuro.debian.net/debian trusty main" >> /etc/apt/sources.list.d/neurodebian.sources.list && \
#	apt-key adv --recv-keys --keyserver hkp://pgp.mit.edu:80 0xA5D32F012649A5A9 && \
#	apt-get update && apt-get install -y fslview

ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
ENV USER=root X11VNC_PASSWORD=override

CMD ["/startvnc.sh"]

