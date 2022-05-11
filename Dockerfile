FROM neurodebian:nd16.04
MAINTAINER Soichi Hayashi <hayashis@iu.edu>

# Install LXDE, VNC server
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
   vim tightvncserver xfwm4 

EXPOSE 5900

RUN apt-get install -y fslview wmctrl

ADD startvnc.sh /
ADD xstartup /root/.vnc/xstartup
ADD start /root/.vnc/start
ENV USER=root X11VNC_PASSWORD=override

CMD ["/startvnc.sh"]
