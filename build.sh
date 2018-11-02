set -x
set -e

tag=16

docker pull neurodebian:nd16.04

docker build -t soichih/vncserver-fslview .
docker tag soichih/vncserver-fslview soichih/vncserver-fslview:$tag
docker push soichih/vncserver-fslview
