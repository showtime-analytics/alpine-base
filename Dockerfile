FROM docker.io/alpine:3.3
MAINTAINER Raul Sanchez <rawmind@gmail.com>

# Install basic packages and skaware s6 daemon runner
RUN apk add --update bash openssl openssh curl grep && rm -rf /var/cacke/apk/* 

# Install selfsigned ca (optional)
#COPY <ca.crt> /etc/ssl/certs/<ca.pem>
#RUN cat /etc/ssl/certs/<ca.pem> >> /etc/ssl/certs/ca-certificates.crt && \
   #cd /etc/ssl/certs/ && \
   #ln -s <ca.pem> `openssl x509 -hash -noout -in <ca.pem>`.0

