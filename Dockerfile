FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update

RUN apt-get install -y build-essential python3.6 python3.6-dev python3-pip python3.6-venv
RUN apt-get install -y git
RUN apt-get install -y libssl-dev libffi-dev
RUN apt-get install -y libsasl2-dev libldap2-dev
RUN apt-get install -y python-ldap
# update pip
RUN python3.6 -m pip install pip --upgrade
RUN python3.6 -m pip install wheel
RUN apt-get install -y libmysqlclient-dev
RUN apt-get install -y libxml2-dev 
RUN apt-get install -y libxmlsec1-dev
RUN apt-get install -y libmemcached-dev 
RUN mkdir /code
ADD requirements.txt /code
WORKDIR /code
RUN pip install --upgrade setuptools
RUN pip install python-memcached==1.58 
RUN pip install -r requirements.txt
