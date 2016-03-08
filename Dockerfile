FROM docker.io/alpine:3.3
MAINTAINER Alberto Gregoris <alberto@showtimeanalytics.com>

# Install basic packages
RUN apk add --update bash curl && rm -rf /var/cache/apk/* && mkdir /opt

# Prepared to add secure communication for all the services
#RUN apk add --update bash openssl curl && rm -rf /var/cache/apk/* && mkdir /opt

# Install selfsigned ca (optional)
#COPY <ca.crt> /etc/ssl/certs/<ca.pem>
#RUN cat /etc/ssl/certs/<ca.pem> >> /etc/ssl/certs/ca-showtimeanalytics.crt && \
   #cd /etc/ssl/certs/ && \
   #ln -s <ca.pem> `openssl x509 -hash -noout -in <ca.pem>`.0

