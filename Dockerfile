FROM debian:wheezy
MAINTAINER Darius Bakunas-Milanowski <bakunas@gmail.com>

WORKDIR /tmp
RUN apt-get update -yqq && apt-get install -yqq \
	gcc \
	git \
	python-dev \
	python-pip \
	python-pefile \
	libssl-dev \
	python-socksipy \
	swig \
	wget && \
	pip install SQLAlchemy PrettyTable python-magic && \
	wget http://downloads.sourceforge.net/project/ssdeep/ssdeep-2.12/ssdeep-2.12.tar.gz && \
	tar xvzf ssdeep-2.12.tar.gz && \
	cd ssdeep-2.12 && \
	./configure && \
	make && \
	make install && \
	pip install pydeep

WORKDIR /opt
RUN git clone https://github.com/botherder/viper.git && \
	cd viper && pip install -r requirements.txt