#Ansible target servers
#docker build --build-arg SECRET=pass -t


FROM ubuntu:19.04

ARG SECRET

RUN apt-get update &&  \
  apt-get install -y --no-install-recommends\
  openssh-server \
  mc \
  vim \
  curl \
  inetutils-ping \
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
