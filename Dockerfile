FROM python:2.7-slim-stretch

ENV PIP=9.0.3 \
    ZC_BUILDOUT=2.2.5 \
    SETUPTOOLS=7.0 \
    PLONE_MAJOR=4.3 \
    PLONE_VERSION=4.3 

LABEL plone=$PLONE_VERSION \
    os="debian" \
    os.version="9" \
    name="Plone 4.3" \
    description="Scoreboard plone image" \
    maintainer="EEA"

RUN useradd --system -m -d /plone -U -u 500 plone \
 && mkdir -p /plone/instance/ /data/filestorage /data/blobstorage


COPY src/plone/* /plone/instance/


RUN buildDeps="wget gcc libc6-dev libpcre3-dev libssl-dev libxml2-dev libxslt1-dev libbz2-dev libjpeg62-turbo-dev libtiff5-dev libopenjp2-7-dev zlib1g-dev" \
 && runDeps="gosu poppler-utils wv rsync lynx netcat libxml2 libxslt1.1 libjpeg62 libtiff5 libopenjp2-7" \
 && apt-get update \
 && apt-get install -y --no-install-recommends $buildDeps \
 && pip install pip==$PIP setuptools==$SETUPTOOLS zc.buildout==$ZC_BUILDOUT \
 && cd /plone/instance \
 && buildout  -c production.cfg \
 && rm -rf bin/buildout \
 && ln -s /usr/local/bin/buildout /plone/instance/bin/buildout \
 && ln -s /usr/local/bin/pip /plone/instance/bin/pip \
 && ln -s /usr/local/bin/python /plone/instance/bin/python \
 && ln -s /data/filestorage/ /plone/instance/var/filestorage \
 && ln -s /data/blobstorage /plone/instance/var/blobstorage \
 && chown -R plone:plone /plone /data \
 && rm -rf /Plone* \
 && apt-get purge -y --auto-remove $buildDeps \
 && apt-get install -y --no-install-recommends $runDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /plone/buildout-cache/downloads/*

VOLUME /data

COPY src/docker/* /

EXPOSE 8080
WORKDIR /plone/instance

HEALTHCHECK --interval=1m --timeout=5s --start-period=1m \
  CMD nc -z -w5 127.0.0.1 8080 || exit 1

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]