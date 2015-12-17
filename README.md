alpine-base
============

Alpine-base image with basic extra software installed. (bash s6 openssl openssh curl and optional selfsigne_ca)

To build

```
docker build -t <repo>/alpine-base:<version> .
```

To run:

```
docker run -it <repo>/alpine-base:<version> 
```

