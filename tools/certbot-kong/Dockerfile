FROM python:2.7.14-alpine3.7

RUN apk update && apk upgrade && apk add gcc libffi-dev musl-dev openssl-dev curl

RUN pip install certbot certbot-dns-cloudflare

ADD /inc/entrypoint.sh /inc/dns-server.ini /

ENTRYPOINT ["/entrypoint.sh"]