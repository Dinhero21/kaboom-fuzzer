FROM eclipse-temurin:17-alpine

# update is required before installing any alpine packages
RUN apk update

RUN apk add git

RUN apk add yq

RUN git clone https://github.com/kaboomserver/server.git
WORKDIR /server

# * chip said he would fix this
# Sadly, command ratelimiting is hardcoded
# https://github.com/kaboomserver/extras/blob/24af535c60ba5a369d77d46eb89cd62dac11cd9a/src/main/java/pw/kaboom/extras/modules/player/PlayerChat.java#L34-L36
# RUN yq -i 'del .packet-limiter.override' ./config/paper-global.yml

RUN yq -i '.watchdog.enabled = false' ./config/paper-global.yml

COPY start.sh start.sh

EXPOSE 25565

ENTRYPOINT ["./start.sh"]
