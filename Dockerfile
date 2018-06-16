FROM hypriot/rpi-alpine-scratch
LABEL maintainer="florian.drevet@gmail.com"

ENV REFRESH_INTERVAL=600
ENV SET_IPV4="yes"
ENV SET_IPV6="no"
ENV TTL=300

RUN apk update && \
apk upgrade && \
apk add bash && \
rm -rf /var/cache/apk/*

RUN apk add --no-cache curl openssl bind-tools

COPY run.sh update_ipv4.sh update_ipv6.sh /usr/local/bin/

WORKDIR /usr/local/bin/

RUN chmod +x run.sh update_ipv4.sh update_ipv6.sh

CMD ["./run.sh"]
