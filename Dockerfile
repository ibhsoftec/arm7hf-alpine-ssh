FROM balenalib/armv7hf-alpine

RUN apk add --upgrade \
	openrc \
    openssh \
    autossh 

COPY sshd_config /etc/ssh/sshd_config

RUN ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N '' \
    && ssh-keygen -t rsa -b 4096 -f /etc/ssh/ssh_host_rsa_key -N '' \
	&& echo "root:root" | chpasswd 
	
RUN rc-update add sshd default

EXPOSE 22
