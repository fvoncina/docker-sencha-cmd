FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
        openjdk-8-jdk \ 
        curl \
        ruby \
        unzip

RUN mkdir /cmd && \
    curl -o /cmd/cmd.sh.zip http://cdn.sencha.com/cmd/6.6.0.13/no-jre/SenchaCmd-6.6.0.13-linux-amd64.sh.zip && \
    unzip -p /cmd/cmd.sh.zip > /cmd/cmd-install.sh && \
    chmod +x /cmd/cmd-install.sh && \
    /cmd/cmd-install.sh -q && \
    rm -rf /cmd

ENV PATH /root/bin/Sencha/Cmd/6.6.0.13/:$PATH

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]

CMD ["help"]