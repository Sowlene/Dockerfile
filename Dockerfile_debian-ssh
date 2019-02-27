#Image to start
FROM debian

#Who create this
MAINTAINER sowlene

RUN apt update -q \
	&& apt -yq install ssh vim git sudo

#Create repository
RUN mkdir /home/sopat/ \
	&& mkdir /home/sopat/projet/ \
	&& cd /home/sopat/projet/

#SSH configuration
RUN sed -i -e "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config \
	&& sed -i -e "s/#Port 22/Port 22/g" /etc/ssh/sshd_config \
	&& service ssh restart \
	&& (echo "Solene"; echo "Solene") | passwd root
#Add files
ADD ansible-varnish/ /home/sopat/projet/

#Setting working directory
WORKDIR /home/sopat/projet/

#Volumes
VOLUME ["/etc/test_ansible", "/var/test_ansible"]

