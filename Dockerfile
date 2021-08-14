FROM openjdk:16-buster

ARG SENCHACMD_VERSION=7.4.0.39

ENV PHANTOM_VERSION=2.1.1 DEBIAN_FRONTEND=noninteractive

COPY entrypoint.sh /

RUN sed -i 's/http/https/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y libc6 binutils libfreetype6 ruby tzdata ttf-dejavu unzip fontconfig wget curl ca-certificates bzip2

RUN wget -q https://cdn.sencha.com/cmd/$SENCHACMD_VERSION/no-jre/SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh.zip -O senchacmd.zip && \
  echo "Expanding senchacmd.zip" && unzip senchacmd.zip && rm senchacmd.zip && chmod +x SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh && \
  echo "Installing sencha" && ./SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh -q -dir /opt/Sencha/Cmd/$SENCHACMD_VERSION -Dall=true && \
  rm SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh && chmod +x /opt/Sencha/Cmd/$SENCHACMD_VERSION/sencha && \
  sed -i "s/http/https/g" "/opt/Sencha/Cmd/$SENCHACMD_VERSION/templates/repo/{senchadir}/repo/remotes/sencha/sencha.cfg" && \
  chmod +x /entrypoint.sh 

RUN wget -qO- https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-${PHANTOM_VERSION}-linux-x86_64.tar.bz2 | tar xvj \
  && cp /phantomjs-*/bin/phantomjs /usr/local/bin/phantomjs \
  && apt-get purge --auto-remove -y wget bzip2 \
  && apt-get clean \
  && rm -rf /phantomjs* /var/lib/apt/lists/* \
  && cp /usr/local/bin/phantomjs /opt/Sencha/Cmd/$SENCHACMD_VERSION/bin/linux-x64/phantomjs/phantomjs

EXPOSE 1841

ENV PATH="/opt/Sencha/Cmd/$SENCHACMD_VERSION:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]

CMD ["help"]