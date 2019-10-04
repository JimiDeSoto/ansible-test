#Ansible target servers
#docker build --build-arg SECRET=pass -t


FROM ubuntu:19.04

ARG SECRET
#RUN deb http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main && \
#apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367

RUN apt-get update &&  \
  apt-get install -y --no-install-recommends\
  software-properties-common \
  openssh-server \
  mc \
  vim \
  curl \
  inetutils-ping &&\
  apt-add-repository --yes --update ppa:ansible/ansible && \
  apt-get install -y --no-install-recommends\
  ansible \
  && rm -rf /var/lib/apt/lists/*
  
RUN mkdir /var/run/sshd
RUN echo 'root:'$SECRET | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
