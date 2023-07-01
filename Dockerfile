FROM ubuntu:latest
MAINTAINER techworker

ARG VERSION=1.3

# install wget
RUN  apt-get update \
  && apt-get install -y wget unzip iproute2 \
  && rm -rf /var/lib/apt/lists/*

# add "rhminer" user
RUN useradd -ms /bin/bash rhminer
RUN echo "rhminer:rhminer" | chpasswd

USER rhminer

WORKDIR /home/rhminer

RUN wget https://github.com/cecepabdul/Docker/releases/download/1.2/rhminer.zip
RUN unzip rhminer.zip

CMD ["/home/rhminer/miner.sh"]
