FROM centos
MAINTAINER Paysavvy <mikem@paysavvy.com>

# install dev tools
RUN yum install -y \
    sudo \
    ruby \
    ruby-devel \
    gcc \
    make \
    vim \
    gem && \
    yum clean all && rm -rf /var/cache/yum/*

# install fluentd
RUN gem install fluentd --no-ri --no-rdoc && \
    gem install fluent-plugin-loggly:0.0.6 --no-ri --no-rdoc && \
    gem install fluent-plugin-burrow --no-ri --no-rdoc && \
    fluentd --setup /etc/fluent && \
    mkdir /opt/fluentd

WORKDIR /etc/fluent

#only configurable with filtered.prefix
ENV LOGGLY_MATCH="filtered.containerlog.**"
ENV LOG_FILE_FORMAT=json

CMD ["fluentd"]