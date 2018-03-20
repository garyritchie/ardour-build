
FROM ubuntu:xenial
LABEL Name=ardour-build Version=0.0.1

ENV XARCH=x86_64
ENV ROOT=/ardour
ENV MAKEFLAGS=-j2

RUN apt-get -y update && apt-get install -y \
  glibmm-2.4-dev \
  # jack \
  # jackd \
  libarchive-dev \
  libasound2-dev \
  libaubio-dev \
  libboost-all-dev \
  libcurl4-gnutls-dev \
  libcwiid-dev \
  libfftw3-dev \
  libglib2.0-dev \
  libgtkmm-2.4-dev \
  # libjack-jackd2-dev \
  liblilv-dev \
  liblo-dev \
  liblrdf0-dev \
  librubberband-dev \
  libsamplerate-dev \
  libserd-dev \
  libsndfile1-dev \
  libsord-dev \
  libsratom-dev \
  libtag1-dev \
  libxml2-dev \
  lv2-dev \
  # qjackctl \
  vamp-plugin-sdk

RUN apt-get install -y \
  git \
  apt-utils

VOLUME [ "/build" ]

RUN git clone git://git.ardour.org/ardour/ardour.git /ardour

WORKDIR /ardour

RUN git checkout tags/5.12
  # && cd ardour \
  # && ./waf configure --with-backends=dummy --test \
  # && ./waf build test

RUN /ardour/tools/x-win/compile.sh


# CMD /usr/games/fortune -a | cowsay
