FROM node:lts

COPY root/ /

RUN chmod 555 /usr/local/bin/entrypoint.sh

EXPOSE 22

VOLUME /app

RUN apt-get update
RUN apt-get install -y openssh-keygen
RUN apt-get install -y openssh-server
RUN sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config
RUN echo "root:root" | chpasswd
RUN npm install -g homey

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]