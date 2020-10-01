FROM alpine:3.7 as Build
RUN apk add --no-cache openssl
ARG HOST_APP
ARG PORT_APP
ENV DOCKERIZE_VERSION v0.6.1
COPY ./nginx.conf .
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-alpine-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && dockerize -template nginx.conf:nginx.conf


FROM nginx:1.15.0-alpine
RUN rm /etc/nginx/conf.d/default.conf
COPY --from=Build ./nginx.conf /etc/nginx/conf.d
