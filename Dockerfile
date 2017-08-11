FROM ubuntu:16.04

ENV  DEBIAN_FRONTEND noninteractive
RUN mkdir -p /var/jenkins_home/workspace/directory-ui-supplier-dev 
RUN sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list
RUN echo running_point 
RUN apt-get -y update 
RUN apt-get -y upgrade 
RUN apt-get install -y git 
RUN apt-get install -y gettext 
RUN apt-get install -y cf-cli python3.5.3 python3-pip  
RUN pip3 install django 
RUN pip3 install jsonschema 
RUN git clone -b dev_to_gds --single-branch https://github.com/uktrade/directory-ui-supplier.git 
RUN git pull -r 
#RUN cp -rf ./directory-ui-supplier/* .
WORKDIR /var/jenkins_home/workspace/directory-ui-supplier-dev
RUN python3 get_env_from_vault.py nl directory-ui-supplier directory-ui-supplier
RUN python3 manage.py compilemessages
