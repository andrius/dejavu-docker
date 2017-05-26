# vim:set ft=dockerfile:
FROM alpine:edge

MAINTAINER Andrius Kairiukstis <andrius@kairiukstis.com>

RUN apk add --update \
      python2 \
      py2-pip \
&&  ln -s /usr/bin/easy_install-2.7 /usr/bin/easy_install \ 
&&  apk add \
      lapack \
      ffmpeg \
      fontconfig \
      libpng \
      portaudio \
      mysql-client \
      mariadb-client-libs \
&&  apk add --virtual .build-deps git \
      build-base \
      gfortran \
      python2-dev \
      fontconfig-dev \
      libpng-dev \
      lapack-dev \
      ffmpeg-dev \
      portaudio-dev \
      mysql-dev \
      openssl \
&&  easy_install pyaudio \
&&  easy_install pydub \
&&  easy_install numpy \
&&  easy_install scipy \
&&  pip install --no-cache-dir MySQL-python \
&&  git clone https://github.com/worldveil/dejavu.git /dejavu \
&&  cd /dejavu \
&&  python ./setup.py install \
&&  apk del .build-deps

WORKDIR /dejavu

# &&  apk --update --repository http://nl.alpinelinux.org/alpine/edge/testing add py-numpy \
# &&  apk --update --repository http://nl.alpinelinux.org/alpine/edge/testing add py-scipy \
# &&  apk --repository http://nl.alpinelinux.org/alpine/edge/testing add py-matplotlib \
#&&  apk del git \
#&&  rm -rf /var/cache/apk/* /tmp

# RUN apk --update add build-base ffmpeg-dev portaudio-dev \
#       ffmpeg portaudio \
# &&  easy_install pyaudio \
# easy_install pydub
# easy_install numpy
