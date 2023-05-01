FROM alpine:latest

RUN apk add --no-cache perl

RUN mkdir /tex
WORKDIR /tex

COPY init.sh .
RUN chmod +x init.sh
RUN ./init.sh