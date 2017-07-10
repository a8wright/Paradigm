FROM ubuntu:14.04

# Install.
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y byobu curl git htop man unzip vim wget && \
  apt-get install -y g++ make doxygen graphviz libboost-dev libboost-graph-dev libboost-program-options-dev libboost-test-dev libgmp-dev cimg-dev && \ 
  rm -rf /var/lib/apt/lists/*

RUN git clone https://bitbucket.org/jorism/libdai.git

RUN cp /libdai/Makefile.LINUX libdai/Makefile.conf

RUN cd /libdai && make

#ENV LD_LIBRARY_PATH /libdai/lib/
#ENV LD_LIBRARY_PATH /libdai/include/

RUN git clone https://github.com/a8wright/Paradigm.git

RUN cd /Paradigm && make

WORKDIR /Paradigm
