FROM ubuntu:latest

RUN echo "installing dependencies..."
#Install dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv \
    git

RUN echo "installing PyYAML..."
RUN python3 -m venv /venv \
    && /venv/bin/pip install --upgrade pip \
    && /venv/bin/pip install PyYAML

ENV PATH="/venv/bin:$PATH"

RUN echo "copying necessary files..."
#Copy from repo to docker
COPY ./feed.py /usr/bin/feed.py
COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

RUN echo "done!"
