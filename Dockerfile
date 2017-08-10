FROM ubuntu:16.04

# For debconf not to complain
ENV  DEBIAN_FRONTEND noninteractive

RUN  apt-get update -y 
RUN  apt-get install -y git
RUN  apt-get install -y gettext
RUN  apt-get install -y cf-cli python3.5.3 python3-pip 
RUN  pip3 install django
RUN  pip3 install jsonschema
RUN  git clone -b dev_to_gds --single-branch https://github.com/uktrade/directory-ui-supplier.git
RUN  cp -rf ./directory-ui-supplier/* .
RUN  python3 get_env_from_vault.py nl directory-ui-supplier directory-ui-supplier
RUN  python3 manage.py compilemessages 
