FROM ubuntu:xenial

MAINTAINER Andrzej Ressel "jereksel@gmail.com"

RUN apt-get update -qq

#Required packages
RUN apt-get install -y git ccache automake lzop bison gperf build-essential zip curl g++-multilib python-networkx libxml2-utils bzip2 libbz2-dev libbz2-1.0 libghc-bzlib-dev squashfs-tools pngcrush schedtool dpkg-dev liblz4-tool make optipng
RUN apt-get install -y openjdk-8-jdk openjdk-8-jre wget htop

#Ccache setup
ENV USE_CCACHE 1
ENV CCACHE_DIR /tmp/ccache

#repo
RUN wget -O /usr/local/bin/repo https://commondatastorage.googleapis.com/git-repo-downloads/repo
RUN chmod 755 /usr/local/bin/repo

VOLUME ["/tmp/ccache", "/workspace"]

RUN apt-get install -y lib32z1 lib32ncurses5 vim nano

#COPY init.sh /init.sh

#RUN chmod 775 /init.sh

RUN useradd -ms /bin/bash android
USER android
ENV USER android

WORKDIR /workspace
#CMD ["/bin/bash", "--init-file", "/workspace/init.sh"]

