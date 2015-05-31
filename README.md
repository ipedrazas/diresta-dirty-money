# Diresta: Dirty Money

In 2011 [Jimmy Diresta](https://twitter.com/JimmyDiResta)  co-hosted "Dirty Money" with his brother, comedian John DiResta, on Discovery Channel. The DiResta brothers set out scouring New York City – from the dumpsters of the Lower East Side to flea markets scattered throughout the five boroughs to various antique shops and collectors.

This is a little experiment to see if it's possible to package the whole series from youtube into a Docker container.

The docker image will use the [youtube-dl](https://rg3.github.io/youtube-dl/) library to download the youtube videos into the container.


To run it, you have to use Linux because what we do is to launch VLC payer from a container using [Chris Daish](https://github.com/chrisdaish) VLC docker image.

What we do is ton run a docker container that mounts our dirty-money image and launches VLC

First we create the dirty-money container 

`docker create --name dirty-money ipedrazas/diresta-dirty-money`

Then we run VLC from a container mounting the volume from the `dirty-money` container.

```
docker run  -v /dev/snd:/dev/snd --privileged -e DISPLAY=unix$DISPLAY \
 -v /tmp/.X11-unix:/tmp/.X11-unix -e uid=$(id -u) -e gid=$(id -g) \
 --volumes-from dirty-money -e FILE=/data chrisdaish/vlc
```
