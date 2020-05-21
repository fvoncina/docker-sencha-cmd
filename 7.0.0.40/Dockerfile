FROM openjdk:8-jre-slim

MAINTAINER fvoncina <fvoncina@gmail.com>

ARG SENCHACMD_VERSION=7.0.0.40

RUN apt-get update && apt-get install -y --no-install-recommends \
        curl \
        unzip \
		libfreetype6 \
		fontconfig \
	&& rm -rf /var/lib/apt/lists/*

RUN curl --silent http://cdn.sencha.com/cmd/$SENCHACMD_VERSION/no-jre/SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh.zip -o /tmp/sencha.zip && \
    unzip /tmp/sencha.zip -d /tmp  && \
    unlink /tmp/sencha.zip  && \
    chmod o+x /tmp/SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh && \
    /tmp/SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh -q -dir /opt/Sencha/Cmd/$SENCHACMD_VERSION && \
    unlink /tmp/SenchaCmd-$SENCHACMD_VERSION-linux-amd64.sh

COPY entrypoint.sh /

WORKDIR /app

ENV PATH="/opt/Sencha/Cmd:${PATH}"

EXPOSE 1841

ENTRYPOINT ["/entrypoint.sh"]

CMD ["help"]