FROM nginx:1.24.0

LABEL org.opencontainers.image.authors="kjxbyz <kjxbyz@163.com>"
LABEL org.opencontainers.image.source="https://github.com/kjxbyz/sentinel"
LABEL org.opencontainers.image.description="A portal site"
LABEL org.opencontainers.image.licenses=MIT

COPY ./nginx/nginx.conf /etc/nginx/
COPY ./nginx/default.conf /etc/nginx/conf.d/

WORKDIR /certs

COPY ./certs/ /certs/

RUN mkdir -p /logs/sentinel && touch $_/error.log
RUN touch /logs/sentinel/access.log

VOLUME ["/logs/sentinel"]

EXPOSE 80
EXPOSE 443

CMD nginx -g "daemon off;"
