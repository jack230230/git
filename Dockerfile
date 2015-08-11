# Base
FROM ubuntu:14.04

RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/' /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y wget build-essential automake openssh-client zlib1g-dev gettext libreadline-dev libssl-dev

RUN wget https://github.com/git/git/archive/v2.5.0.tar.gz -O git-2.5.0.tar.gz

RUN tar -zxf git-2.5.0.tar.gz 

RUN cd git-2.5.0 && autoconf && ./configure --without-tcltk && make && make install

RUN ln -s /usr/local/bin/git /usr/bin/git
