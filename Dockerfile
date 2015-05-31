FROM python:3-onbuild
MAINTAINER ipedrazas@gmail.com

WORKDIR /app
VOLUME ["/data"]

RUN youtube-dl -i  https://www.youtube.com/playlist?list=PLz-EEBD2hrhaRUokp-kICeCSj9mVD9JPm -o '/data/%(title)s.%(ext)s' --restrict-filenames
