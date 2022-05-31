FROM ubuntu:xenial
MAINTAINER Joseph Marhee <jmarhee@interiorae.com>

RUN apt update
RUN apt install -y \
    libtool \
    autoconf \
    build-essential \
    pkg-config \
    automake \
    tcsh \
    zlib1g-dev \
    libasound2 \
    libcups2 \
    libxrender1 \
    libxext6 \
    libxext-dev \
    libfontconfig1 \
    libfontconfig-dev

COPY pkgs/* /

RUN tar xvf /libpng_1.2.54.orig.tar.xz

WORKDIR /libpng-1.2.54
RUN ./autogen.sh
RUN ./configure
RUN make -j8
RUN make install
RUN ldconfig

WORKDIR /

#RUN apt install -y ./multiarch-support_2.19-18+deb8u10_amd64.deb
RUN apt install -y ./libgstreamer0.10-0_0.10.36-1.5ubuntu1_amd64.deb
RUN apt install -y ./libgstreamer-plugins-base0.10-0_0.10.36-1.1ubuntu2.1_amd64.deb

RUN apt install -y ./scrivener-1.9.0.1-amd64.deb

ENTRYPOINT ["scrivener"]
CMD []