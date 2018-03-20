#!/bin/bash

sudo apt-get install -y \
  libgtkmm-2.4-dev \
  libcurl4-gnutls-dev \
  liblo-dev \
  libtag1-dev \
  vamp-plugin-sdk \
  librubberband-dev \
  libfftw3-dev \
  libaubio-dev \
  libxml2-dev \
  libcppunit-dev \
  libarchive-dev \
  liblrdf0-dev \
  libsamplerate0-dev \
  lv2-dev \
  libserd-dev \
  libsord-dev \
  libsratom-dev \
  liblilv-dev \
  libsuil-dev

git clone git://git.ardour.org/ardour/ardour.git
cd ardour

./waf configure --no-phone-home
./waf

cd tools/linux_packaging
./build --public --strip some
./package --public --singlearch