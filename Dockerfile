FROM docker.io/alpine:3.2
MAINTAINER Raul Sanchez <rawmind@gmail.com>

# Install basic packages and skaware s6 daemon runner
RUN apk add --update bash openssl openssh curl grep && rm -rf /var/cacke/apk/* \
  && mkdir -p /opt/s6; \
wget https://github.com/just-containers/skaware/releases/download/v1.16.1/s6-2.2.2.0-linux-amd64-bin.tar.gz; \
tar -xvzf s6-2.2.2.0-linux-amd64-bin.tar.gz --directory /opt/s6; \
chmod -R 755 /opt/s6/usr/bin; \
mv /opt/s6/usr/bin/* /usr/bin; \
rm s6-2.2.2.0-linux-amd64-bin.tar.gz; \
rm -rf /opt/s6

# Install selfsigned ca (optional)
#COPY <ca.crt> /etc/ssl/certs/<ca.pem>
#RUN cat /etc/ssl/certs/<ca.pem> >> /etc/ssl/certs/ca-certificates.crt && \
   #cd /etc/ssl/certs/ && \
   #ln -s <ca.pem> `openssl x509 -hash -noout -in <ca.pem>`.0

