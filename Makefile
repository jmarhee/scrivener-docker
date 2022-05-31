shell = /bin/bash

deps:
	if [ ! -d pkgs ]; then mkdir pkgs; fi
	cd pkgs && \
	wget http://archive.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng_1.2.54.orig.tar.xz && \
	wget http://fr.archive.ubuntu.com/ubuntu/pool/universe/g/gstreamer0.10/libgstreamer0.10-0_0.10.36-1.5ubuntu1_amd64.deb && \
	wget https://ftp.lysator.liu.se/ubuntu/pool/main/g/gst-plugins-base0.10/libgstreamer-plugins-base0.10-0_0.10.36-1.1ubuntu2.1_amd64.deb && \
	wget http://www.literatureandlatte.com/scrivenerforlinux/scrivener-1.9.0.1-amd64.deb
# 	wget http://ftp.us.debian.org/debian/pool/main/g/glibc/multiarch-support_2.19-18+deb8u10_amd64.deb && \

build-image:
	docker build -t jmarhee/scrivener:$(TAG) . --no-cache

build-offline:
	docker build -t jmarhee/scrivener-offline:$(TAG) . -f Dockerfile.offline --no-cache

quick-launch:
	x11docker jmarhee/scrivener

quick-launch-offline:
	x11docker jmarhee/scrivener-offline