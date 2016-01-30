FROM docker.io/alpine:3.3
MAINTAINER Raul Sanchez <rawmind@gmail.com>

# Install basic packages and skaware s6 daemon runner
RUN apk add --update bash monit openssl openssh curl grep && rm -rf /var/cacke/apk/* \
  && mkdir -p /etc/monit/conf.d/
COPY monit/monitrc /etc/monitrc
RUN chown root:root /etc/monitrc && chmod 700 /etc/monitrc
COPY monit/basic /etc/monit/conf.d/basic

# Install selfsigned ca (optional)
#COPY <ca.crt> /etc/ssl/certs/<ca.pem>
#RUN cat /etc/ssl/certs/<ca.pem> >> /etc/ssl/certs/ca-certificates.crt && \
   #cd /etc/ssl/certs/ && \
   #ln -s <ca.pem> `openssl x509 -hash -noout -in <ca.pem>`.0

