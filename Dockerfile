FROM ruby:2.4
LABEL mantainer="Helton Rodrigues"

RUN apt-get update

RUN apt-get install -y openssh-server nodejs

RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22
EXPOSE 3000

CMD ["/usr/sbin/sshd", "-D"]