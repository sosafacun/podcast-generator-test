FROM ubuntu:latest

RUN echo "installing dependencies..."
#Install dependencies
RUN apt-get update && apt-get install -y \
    python3.10 \
    python3-pip \
    git

RUN echo "installing PyYAML..."
RUN pip3 install PyYAML

RUN echo "copying necessary files..."
#Copy from repo to docker
COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

RUN echo "done!"