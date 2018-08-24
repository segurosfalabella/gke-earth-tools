FROM alpine:3.7

RUN apk update && \
    apk add curl && \
    apk add bind-tools && \
    apk add fish && \
    apk add docker && \
    apk add httpie && \
    apk add nmap && \
    apk add jq

CMD ["tail", "-f", "/dev/null"]