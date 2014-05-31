FROM ubuntu:14.04
RUN apt-get -q update
RUN apt-get -qy install bsdmainutils
RUN apt-get -qy install build-essential
RUN apt-get -qy install curl
RUN apt-get -qy install libprotobuf-c0-dev
RUN apt-get -qy install linux-headers-generic
RUN apt-get -qy install protobuf-c-compiler
RUN apt-get -qy install tmux
RUN mkdir /src
WORKDIR /src
ENV CRIU 1.2
RUN curl http://download.openvz.org/criu/criu-$CRIU.tar.bz2 | tar -jxf-
RUN make -C criu-$CRIU
RUN cp criu-$CRIU/criu /usr/local/sbin
ADD wrapper /usr/local/sbin/
CMD ["wrapper"]
