FROM node:lts-alpine

EXPOSE 22

RUN apk add --no-cache openssh-keygen openssh-server \
  && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
  && echo "root:root" | chpasswd

RUN npm install -g homey

VOLUME /app

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]