FROM ubuntu:18.04

MAINTAINER Reinhard Pointner <rednoah@filebot.net>

RUN apt-get update \
 && apt-get install -y default-jre-headless libjna-java mediainfo libchromaprint-tools unrar p7zip-full p7zip-rar mkvtoolnix mp4v2-utils gnupg curl file inotify-tools \
 && rm -rvf /var/lib/apt/lists/*

RUN curl https://get.filebot.net/filebot/BETA/FileBot_4.8.6_universal.deb -o FileBot.deb && dpkg -i FileBot.deb && rm FileBot.deb

VOLUME /data
VOLUME /volume1

ENV HOME /data
ENV LANG C.UTF-8
ENV FILEBOT_OPTS "-Dapplication.deployment=docker -Duser.home=$HOME"

WORKDIR /volume1

ENTRYPOINT ["filebot"]
