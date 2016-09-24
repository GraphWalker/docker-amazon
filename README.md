# docker-amazon

## To build:
```
docker build -t graphwalker/amazon .
```


## To run:
```
docker pull graphwalker/amazon
docker run -ti --rm -e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v $HOME/.Xauthority:/home/developer/.Xauthority --net=host --pid=host --ipc=host graphwalker/amazon
```
