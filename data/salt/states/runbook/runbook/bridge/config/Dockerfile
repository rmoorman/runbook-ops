# Pull base image
FROM dockerfile/ubuntu

MAINTAINER Benjamin Cane <ben@bencane.com>

# Update
RUN apt-get update
RUN apt-get upgrade -y

# Install required packages
RUN apt-get install -y python python-dev python-pip python-virtualenv wget unzip
RUN apt-get install -y libssl-dev libffi-dev git
RUN apt-get install -y stunnel supervisor
RUN rm -rf /var/lib/apt/lists/*

# Create working directories
RUN mkdir -p /code /config

# Pull application source from git
RUN git clone https://github.com/asm-products/cloudroutes-service.git --branch {{ git_branch }}

# Copy Code
RUN cp -R cloudroutes-service/src/bridge/* /code/

# Copy Configurations
RUN cp cloudroutes-service/src/bridge/requirements.txt /config/requirements.txt
ADD config/bridge.yml /config/bridge.yml
ADD config/stunnel-client.conf /config/stunnel-client.conf
ADD config/supervisord.conf /config/supervisord.conf
ADD config/supervisord-purge_history.conf /config/supervisord-purge_history.conf
ADD config/ssl/key.pem /config/key.pem
ADD config/ssl/cert.pem /config/cert.pem
ADD config/mgmtrun.sh /code/mgmtrun.sh

# Install requirements
RUN pip install -r /config/requirements.txt

# Command to run
CMD /usr/bin/supervisord -c /config/supervisord.conf
