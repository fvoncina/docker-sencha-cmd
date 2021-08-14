FROM openjdk:16-buster

ARG SENCHACMD_VERSION=7.4.0.39

COPY entrypoint.sh /

RUN sed -i 's/http/https/g' /etc/apt/sources.list && apt update && apt install -y libc6 binutils libfreetype6 ruby tzdata ttf-dejavu unzip fontconfig wget curl

RUN wget -q https://cdn.sencha.com/cmd/$SENCHACMD_VERSION/no-jre/SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh.zip -O senchacmd.zip && \
  echo "Expanding senchacmd.zip" && unzip senchacmd.zip && rm senchacmd.zip && chmod +x SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh && \
  echo "Installing sencha" && ./SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh -q -dir /opt/Sencha/Cmd/$SENCHACMD_VERSION -Dall=true && \
  rm SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh && chmod +x /opt/Sencha/Cmd/$SENCHACMD_VERSION/sencha && \
  sed -i "s/http/https/g" "/opt/Sencha/Cmd/$SENCHACMD_VERSION/templates/repo/{senchadir}/repo/remotes/sencha/sencha.cfg" && \
  chmod +x /entrypoint.sh 

ENV PJS_HOME=/usr/lib/phantomjs

RUN mkdir -p /tmp && cd /tmp
RUN curl -Ls "https://github.com/israelroldan/docker-sencha-cmd/raw/phantomjs-2.1.1/dockerized-phantomjs-2.1.1.tar.gz" | tar xz -C / 
RUN ln -s "$PJS_HOME/bin/phantomjs" /usr/bin/phantomjs 
RUN rm /opt/Sencha/Cmd/$SENCHACMD_VERSION/bin/linux-x64/phantomjs/phantomjs
RUN ln -s "$PJS_HOME/bin/phantomjs" /opt/Sencha/Cmd/$SENCHACMD_VERSION/bin/linux-x64/phantomjs/phantomjs

EXPOSE 1841

ENV PATH="/opt/Sencha/Cmd/$SENCHACMD_VERSION:${PATH}"

ENTRYPOINT ["/entrypoint.sh"]

CMD ["help"]