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

RUN wget -qO- https://github.com/git/git/archive/v2.8.1.tar.gz | tar xvz

RUN cd git-2.8.1 && autoconf && ./configure --without-tcltk && make && make install && ln -s /usr/local/bin/git /usr/bin/git

RUN ln -s /usr/local/bin/git-upload-pack /usr/bin/git-upload-pack
RUN ln -s /usr/local/bin/git-receive-pack /usr/bin/git-receive-pack

RUN git config --global pack.windowMemory "256m" \
    && git config --global pack.threads "1"
