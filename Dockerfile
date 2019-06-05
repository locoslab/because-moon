FROM ubuntu:18.04

LABEL name="because-moon"
LABEL version="1.2.0"
LABEL description="Build and test because-moon projects"
LABEL vendor="Locoslab"
LABEL maintainer="Locoslab <dockerhub@locoslab.com>"

ENV DEBIAN_FRONTEND noninteractive

COPY root /root/

RUN true && \
	dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get install -y gpg && \
	mv /root/llvm.list /etc/apt/sources.list.d/ && \
	apt-key add /root/llvm-snapshot.gpg.key && \
	rm /root/llvm-snapshot.gpg.key && \
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
		vim \
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
		pandoc \
		gdb \
		cppcheck \
		vera++ \
		clang-8 \
		clang-tools-8 \
		clang-tidy-8 \
		clang-format-8 \
		openjdk-8-jdk-headless \
		libglib2.0-dev \
		libglib2.0-dev:i386 \
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
