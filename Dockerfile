FROM ubuntu:20.04

RUN cp /etc/apt/sources.list /etc/apt/sources.list_bak
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN apt update -y
RUN apt upgrade -y


RUN apt install nginx -y

RUN apt install wget git vim -y
COPY install-nodejs.sh /tmp/
RUN /bin/bash /tmp/install-nodejs.sh

RUN apt install iputils-ping net-tools -y