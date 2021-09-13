FROM ubuntu:20.04
RUN apt-get -q update
RUN apt-get -qy install bsdmainutils
RUN apt-get -qy install build-essential
RUN apt-get -qy install curl
RUN apt-get -qy install libbsd-dev
RUN apt-get -qy install libcap-dev
RUN apt-get -qy install libnet-dev
RUN apt-get -qy install libnl-3-dev
RUN apt-get -qy install libprotobuf-c-dev
RUN apt-get -qy install libprotobuf-dev
RUN apt-get -qy install linux-headers-generic
RUN DEBIAN_FRONTEND=nontineractive apt-get -qy install pkg-config
RUN apt-get -qy install protobuf-c-compiler
RUN apt-get -qy install protobuf-compiler
RUN apt-get -qy install python3
RUN apt-get -qy install tmux
RUN mkdir /src
WORKDIR /src
ENV CRIU 3.15
RUN curl http://download.openvz.org/criu/criu-$CRIU.tar.bz2 | tar -jxf-
RUN make -C criu-$CRIU
RUN cp criu-$CRIU/criu/criu /usr/local/sbin
ADD wrapper /usr/local/sbin/
CMD ["wrapper"]
