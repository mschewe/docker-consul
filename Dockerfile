FROM ubuntu:14.04
MAINTAINER Mark Schewe <mark.schewe@stampay.com>
ENV REFRESHED_AT 2015-02-04

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt-get -qqy update
RUN apt-get -qqy install curl unzip

ADD https://dl.bintray.com/mitchellh/consul/0.4.1_linux_amd64.zip /tmp/consul.zip
RUN cd /usr/sbin && unzip /tmp/consul.zip && chmod +x /usr/sbin/consul && rm /tmp/consul.zip

ADD https://dl.bintray.com/mitchellh/consul/0.4.1_web_ui.zip /tmp/webui.zip
RUN cd /tmp/ && unzip webui.zip && mv dist/ /webui/

VOLUME [ "/data" ]

ADD consul.json /config/
ADD web.json /config/

EXPOSE 53/udp 8300 8301 8301/udp 8302 8302/udp 8400 8500

ENTRYPOINT [ "/usr/sbin/consul", "agent", "-config-dir=/config/" ]
CMD []
