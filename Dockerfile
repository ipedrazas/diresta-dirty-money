FROM python:3-onbuild
MAINTAINER ipedrazas@gmail.com

ADD run.sh /app/run.sh
RUN chmod +x /app/run.sh

WORKDIR /app
VOLUME ["/data"]

RUN youtube-dl -i --max-quality mp4 https://www.youtube.com/playlist?list=PLz-EEBD2hrhaRUokp-kICeCSj9mVD9JPm -o '/data/%(title)s.%(ext)s'
