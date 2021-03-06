FROM ubuntu:18.04
MAINTAINER R.H <Ram.Hakimi@gmail.com>

RUN apt-get update && \
    apt-get install -y apt-transport-https gnupg2 curl apt-utils telnet iputils-ping dnsutils

# Kubectl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && \
    apt-get install -y kubectl

# Clean
RUN rm /etc/apt/sources.list.d/kubernetes.list && \
    apt-get clean 