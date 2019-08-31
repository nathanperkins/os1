FROM centos:7

LABEL maintainer="Nathan Perkins <nperkins487@gmail.com>"

RUN groupadd -g 888 appuser && \
    useradd -r -u 888 -g appuser appuser


RUN yum update -y && yum clean all

# install extra packages
RUN yum -y group install "Development Tools" && yum clean all
RUN yum -y install vim && yum clean all
RUN yum -y install vim dos2unix && yum clean all

# install python 3.4
RUN yum -y install epel-release && yum clean all
RUN yum -y install python34 && yum clean all
RUN curl https://bootstrap.pypa.io/get-pip.py | /usr/bin/python3.4
USER appuser

CMD [ "/bin/bash" ]
