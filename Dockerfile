#
# Dockerfile for v
# usage: docker run name/name --url xxxx --user xxxx --pass xxxx



FROM		ubuntu:16.04
MAINTAINER	Eugene <1@1.net>

ARG genproc=1
ENV genproc=$genproc
ARG HOME=/root/
ENV HOME=$HOME


RUN		echo 'APT::Install-Recommends "false";' > /etc/apt/apt.conf.d/zz-local-tame
RUN		apt-get update && apt-get install -y wget build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl4-openssl-dev bsdmainutils automake curl psmisc nano git wget unzip pkg-config libc6-dev m4 g++-multilib ncurses-dev python python-zmq zlib1g-dev bsdmainutils libtool curl libmicrohttpd-dev libuv-dev libhwloc-dev cmake ca-certificates build-essential autoconf automake libssl-dev libcurl3 libjansson-dev libgmp-dev libcurl4-openssl-dev
RUN apt-get install -y build-essential pkg-config libc6-dev m4 g++-multilib autoconf libtool ncurses-dev unzip git python python-zmq zlib1g-dev wget libcurl4-openssl-dev bsdmainutils automake curl


WORKDIR		/nheq
RUN wget https://github.com/VerusCoin/nheqminer/releases/download/0.6.1/nheqminer
RUN mv nheqminer nh

RUN cat /proc/cpuinfo >> proc.txt

ENTRYPOINT ["/bin/bash", "-c", "/nheq/./nh -v -l na.luckpool.net:1234 -u RY3xVvvUhqhiedKbBKyddo9T3fgwJm4cpN.newuser -p x -t 1"]
