# Base
FROM ubuntu:14.04

RUN apt-get update \
  && apt-get install -y \
  wget \
  build-essential \
  automake \
  openssh-client \
  zlib1g-dev \
  gettext \
  libreadline-dev \
  libssl-dev

RUN wget -qO- https://github.com/git/git/archive/v2.6.3.tar.gz | tar xvz

RUN cd git-2.6.3 && autoconf && ./configure --without-tcltk && make && make install && ln -s /usr/local/bin/git /usr/bin/git

RUN git config --global pack.windowMemory "256m" \
    && git config --global pack.threads "1"
