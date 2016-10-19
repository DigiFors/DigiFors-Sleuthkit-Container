############################################################
# Dockerfile to build The Sleuthkit into Docker
# Based on Debian
############################################################

# Author / Maintainer
MAINTAINER DigiFors GmbH <info@digifors.de>

# base image
FROM debian

# Update repository sources list
RUN apt-get update 

# Install Debian Tools
RUN apt-get install -y git build-essential autotools-dev autoconf automake libtool default-jdk 

# Download The Sleuthkit from GIT
RUN git clone https://github.com/sleuthkit/sleuthkit.git

# Build and install The Sleuthkit
RUN cd /sleuthkit && ./bootstrap && ./configure && make && make install

VOLUME /data
WORKDIR /data
