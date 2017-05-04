FROM alpine:3.5

COPY foo.txt /
RUN cat foo.txt
