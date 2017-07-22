FROM ubuntu:16.04

# For debconf not to complain
ENV  DEBIAN_FRONTEND noninteractive

RUN  echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup && \
     apt-get update -y && \
     apt-get install -y wget apt-transport-https ca-certificates software-properties-common && \
     wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - && \
     echo "deb http://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list && \
     add-apt-repository -y ppa:fkrull/deadsnakes && \
     apt-get update -y && \
     apt-get install -y git cf-cli curl python3.6 && \
     apt-get clean && apt-get autoremove && \
     rm -rf /var/lib/cache/* /var/lib/log/* /tmp/* /var/tmp/*
