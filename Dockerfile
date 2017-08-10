FROM ubuntu:16.04

ENV  DEBIAN_FRONTEND noninteractive
RUN mkdir -p /var/jenkins_home/workspace/directory-ui-supplier-dev && \
 cd /var/jenkins_home/workspace/directory-ui-supplier-dev && \
 sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \ 
 echo running_point && \
 apt-get -y update && \
 apt-get -y upgrade && \
 apt-get install -y git && \
 apt-get install -y gettext && \
 apt-get install -y cf-cli python3.5.3 python3-pip  && \
 pip3 install django && \
 pip3 install jsonschema && \
 git clone -b dev_to_gds --single-branch https://github.com/uktrade/directory-ui-supplier.git && \
 cp -rf ./directory-ui-supplier/* . && \ 
 python3 get_env_from_vault.py nl directory-ui-supplier directory-ui-supplier && \
 python3 manage.py compilemessages 
