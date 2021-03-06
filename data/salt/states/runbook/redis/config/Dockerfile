## Redis Dockerfile for use with Runbook.io
# This docker container implements redis with stunnel
# stunnel is used to create encrypted communication between docker instances

FROM dockerfile/ubuntu

MAINTAINER Benjamin Cane <ben@bencane.com>

# Install Redis (stolen from Dockerfile/Redis)
RUN \
  cd /tmp && \
  wget http://download.redis.io/redis-stable.tar.gz && \
  tar xvzf redis-stable.tar.gz && \
  cd redis-stable && \
  make && \
  make install && \
  cp -f src/redis-sentinel /usr/local/bin && \
  mkdir -p /etc/redis && \
  cp -f *.conf /etc/redis && \
  rm -rf /tmp/redis-stable* 

# Install stunnel and supervisor
RUN apt-get update
RUN apt-get install -y stunnel supervisor

# Deploy Config files
RUN mkdir -p /config /data/redis
ADD config/supervisord.conf /config/supervisord.conf
ADD config/stunnel-server.conf /config/stunnel-server.conf
ADD config/redis.conf /config/redis.conf
ADD config/ssl/key.pem /config/key.pem
ADD config/ssl/cert.pem /config/cert.pem

# Expose Ports
EXPOSE {{ exposed_port }}
EXPOSE {{ local_port }}

# Run process
CMD /usr/bin/supervisord -c /config/supervisord.conf
