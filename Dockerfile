FROM sckyzo/nginx-php

ARG PRIVATEBIN_VER=1.4.0

ENV GID=1000 UID=1000 \
    UPLOAD_MAX_SIZE=10M \
    MEMORY_LIMIT=128M

RUN echo " https://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
 && BUILD_DEPS="tar libressl ca-certificates" \
 && apk -U upgrade && apk add $BUILD_DEPS \
 && mkdir privatebin && cd privatebin \
 && wget -qO- https://github.com/PrivateBin/PrivateBin/archive/${PRIVATEBIN_VER}.tar.gz | tar xz --strip 1 \
 && mv cfg/conf.sample.php cfg/conf.php \
 && apk del $BUILD_DEPS \
 && rm -f /var/cache/apk/*

COPY rootfs /

RUN chmod +x /usr/local/bin/run.sh /etc/s6.d/*/* /etc/s6.d/.s6-svscan/*

VOLUME /privatebin/data /php/session

EXPOSE 8888

LABEL maintainer="SckyzO <https://www.github.com/sckyzo>" \
      description="A minimalist, open source online pastebin where the server has zero knowledge of pasted data" \
      version="PrivateBin ${PRIVATEBIN_VER}"

CMD ["run.sh"]
