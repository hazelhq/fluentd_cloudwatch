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

# install fluentd and plugins
RUN gem install fluentd --no-ri --no-rdoc && \
    gem install fluent-plugin-burrow --no-ri --no-rdoc && \
    gem install fluent-plugin-cloudwatch-logs --no-ri --no-rdoc && \
    fluentd --setup /etc/fluent && \
    mkdir /opt/fluentd

EXPOSE 24224
    
WORKDIR /etc/fluent

ENV LOG_FILE_FORMAT=json

RUN mkdir -p /var/log/fluent/myapp

CMD ["fluentd"]