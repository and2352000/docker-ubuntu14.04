#
# Ubuntu Dockerfile
#
# https://github.com/dockerfile/ubuntu
#

# Pull base image.
FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget netcat && \
  rm -rf /var/lib/apt/lists/* 

RUN apt-get install sudo  
RUN useradd -ms /bin/bash juiz
RUN echo "juiz:1234" | chpasswd
RUN echo "root:wnec1234" | chpasswd

# Define working directory & User.
USER juiz
WORKDIR /home/juiz 
  
# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.gitconfig /root/.gitconfig
ADD root/.scripts /root/.scripts



# Define default command.

CMD ["bash"]