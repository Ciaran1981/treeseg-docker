FROM ubuntu:20.04

MAINTAINER Ciaran Robb  

ENV DEBIAN_FRONTEND noninteractive

#Install dependencies
RUN apt-get update && apt-get install -y --install-recommends \
x11proto-core-dev make cmake git libx11-dev libpcl-dev libarmadillo-dev && \
   apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# the offcial one...
#RUN apt-get update && apt-get install -y build-essential make cmake \
# list of libs

#RUN mkdir /opt
WORKDIR /opt

#get treeseg
RUN git clone https://github.com/Ciaran1981/treeseg.git

#folders etc

RUN mkdir -p treeseg/build

WORKDIR /opt/treeseg/build

#make 
RUN cmake ..

RUN make -j$(nproc)

# not required...?
#RUN make install 

ENV PATH /opt/treeseg/build:$PATH

WORKDIR /opt

RUN mkdir home

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD [ "/bin/bash" ]
