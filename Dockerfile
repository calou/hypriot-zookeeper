FROM hypriot/rpi-java

ENV DEBIAN_FRONTEND noninteractive
ENV ZOOKEEPER_VERSION 3.4.7

RUN apt-get update && apt-get install -y curl python

# https://www.apache.org/mirrors/dist.html
RUN curl -fL http://apache.mirror.digitalpacific.com.au/zookeeper/stable/zookeeper-${ZOOKEEPER_VERSION}.tar.gz | tar xzf - -C /opt && \
mv /opt/zookeeper-${ZOOKEEPER_VERSION} /opt/zookeeper

VOLUME /tmp/zookeeper

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/zookeeper/bin

CMD ["zkServer.sh", "start-foreground"]
