FROM ubuntu:16.04

WORKDIR /root

RUN apt-get update && apt-get -y upgrade && apt-get -y install curl python-dev build-essential locales vim && \
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    pip install --user jenkins-job-builder && \
    mkdir -p /etc/jenkins_jobs/
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8
ENV PATH="/root/.local/bin:${PATH}"

ADD jenkins_jobs.ini /etc/jenkins_jobs/jenkins_jobs.ini
WORKDIR /root/jenkins-job-builder
