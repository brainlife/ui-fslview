#from kaixhin/vnc

# Start with Ubuntu base image
#FROM ubuntu:14.04
#FROM neurodebian:nd14.04
FROM neurodebian:nd16.04
MAINTAINER Soichi Hayashis <hayashis@iu.edu>

# Install LXDE, VNC server, XRDP
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
   vim tightvncserver xfce4 

RUN apt-get remove -y xfce4-panel

EXPOSE 5900

RUN apt-get install -y fslview 
RUN apt-get install -y wmctrl

ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
ENV USER=root X11VNC_PASSWORD=override

CMD ["/startvnc.sh"]

