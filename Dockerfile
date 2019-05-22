FROM centos:7

LABEL maintainer="Nathan Perkins <nperkins487@gmail.com>"

# update the base image
RUN yum update -y; yum clean all

# install extra packages
RUN yum -y group install "Development Tools"
RUN yum -y install vim
RUN yum -y install dos2unix

CMD [ "/bin/bash" ]
