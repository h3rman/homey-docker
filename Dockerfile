FROM node:lts

COPY root/ /

RUN chmod 555 /usr/local/bin/entrypoint.sh

EXPOSE 22

VOLUME /app

RUN apt-get update && apt-get install -y \
    openssh-keygen \
    openssh-server \
    && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
    && echo "root:root" | chpasswd

RUN npm install -g homey

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]