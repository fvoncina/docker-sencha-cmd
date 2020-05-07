FROM ubuntu:latest

MAINTAINER fvoncina <fvoncina@gmail.com>

ARG SENCHACMD_VERSION=6.7.0.63

RUN mkdir -p /project && \
    apt-get update && \
    apt-get install -y \
        openjdk-8-jre \ 
        curl \
        ruby \
        unzip

COPY entrypoint.sh /

RUN mkdir /cmd && \
    curl -o /cmd/cmd.sh.zip http://cdn.sencha.com/cmd/${SENCHACMD_VERSION}/no-jre/SenchaCmd-${SENCHACMD_VERSION}-linux-amd64.sh.zip && \
    unzip -p /cmd/cmd.sh.zip > /cmd/cmd-install.sh && \
    chmod +x /cmd/cmd-install.sh && \
    /cmd/cmd-install.sh -q -dir /sencha && \
    rm -rf /cmd && \
    chmod +x /entrypoint.sh

ENV PATH /sencha:$PATH

VOLUME /project
WORKDIR /project

EXPOSE 1841

ENTRYPOINT ["/entrypoint.sh"]

CMD ["help"]