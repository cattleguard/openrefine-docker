FROM ubuntu:latest

MAINTAINER probably no one

RUN apt-get update
RUN apt-get install -y default-jre curl

WORKDIR /app

RUN curl -sL https://github.com/OpenRefine/OpenRefine/releases/download/3.1/openrefine-linux-3.1.tar.gz -O
RUN tar xzf openrefine-linux-3.1.tar.gz


VOLUME /data
WORKDIR /data

EXPOSE 3333
ENTRYPOINT ["/app/openrefine-3.1/refine"]
CMD ["-i", "0.0.0.0", "-d", "/data"]
