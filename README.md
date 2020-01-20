# docker-amazon

## To build:
Building the image by your own. This is not required. You can pull it from the hub.docker.com directly. See section *To run* below.
```
docker build -t graphwalker/amazon .
```


## To run:
```
docker pull graphwalker/amazon
docker run -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/developer/.Xauthority --net=host --pid=host --ipc=host graphwalker/amazon
```
