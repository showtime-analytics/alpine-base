FROM docker.io/alpine:3.2
MAINTAINER Raul Sanchez <rawmind@gmail.com>

# Install basic packages and create /opt dir
RUN apk add --update bash s6 openssl openssh curl && rm -rf /var/cacke/apk/* \
  && mkdir /opt

# Install selfsigned ca (optional)
#COPY <ca.crt> /etc/ssl/certs/<ca.pem>
#RUN cat /etc/ssl/certs/<ca.pem> >> /etc/ssl/certs/ca-certificates.crt && \
   #cd /etc/ssl/certs/ && \
   #ln -s <ca.pem> `openssl x509 -hash -noout -in <ca.pem>`.0

