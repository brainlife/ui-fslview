docker build -t soichih/vncserver-fslview .
if [ $? -eq 0 ];
then
    docker push soichih/vncserver-fslview
fi
