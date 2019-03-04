FROM ubuntu:18.04

MAINTAINER Locoslab <dockerhub@locoslab.com>

LABEL name="because-moon"
LABEL version="1.0.0"
LABEL description="Build and test because-moon projects"
LABEL vendor="Locoslab"

ENV DEBIAN_FRONTEND noninteractive

RUN true && \
	dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get install -y \
		locales \
		build-essential \
		gcc-multilib \
		git \
		rsync \
		ruby \
		python-pip \
		zip \
		unzip \
		curl \
		wget \
		nano \
		zsh \
		psmisc \
		cmake \
		ninja-build \
		bear \
		doxygen \
		valgrind \
		libc6-dbg \
		libc6-i686:i386 \
		libc6-dbg:i386 \
		gcovr \
		lcov \
		gdb \
		cppcheck \
		vera++ \
		clang \
		clang-tidy \
		clang-format \
		clang-tools \
		openjdk-8-jdk-headless \
		libglib2.0-dev \
		tshark \
	&& \
	locale-gen en_US.UTF-8 && \
	apt-get clean autoclean -y && \
	apt-get autoremove -y && \
	rm -rf /var/lib/apt/lists/* && \
	true

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8

CMD ["/bin/bash"]

WORKDIR /x