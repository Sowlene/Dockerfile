FROM debian

MAINTAINER sowlene

RUN apt update -q \
	&& apt -yq install ssh vim git sudo

RUN mkdir /home/sopat/ \
	&& mkdir /home/sopat/projet/ \
	&& cd /home/sopat/projet/
RUN sed -i -e "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config \
	&& sed -i -e "s/#Port 22/Port 22/g" /etc/ssh/sshd_config

RUN echo "Solene" | passwd "root" --stdin

ADD ansible-varnish/ /home/sopat/projet/

WORKDIR /home/sopat/projet/
VOLUME ["/etc/test_ansible", "/var/test_ansible"]
