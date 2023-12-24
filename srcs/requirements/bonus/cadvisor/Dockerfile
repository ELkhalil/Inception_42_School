FROM    debian:bullseye

RUN     apt-get update && \
        apt-get upgrade -y && \
        apt-get -y install wget && \
        rm -rf /var/lib/apt/lists/*

RUN     wget -O /usr/local/bin/cadvisor https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64 \
        && chmod 777 /usr/local/bin/cadvisor

EXPOSE  8080

CMD     ["/usr/local/bin/cadvisor"]
