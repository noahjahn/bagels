FROM ghcr.io/astral-sh/uv:debian

ARG UID=1000

USER root

RUN useradd bagels --uid $UID --create-home --user-group --shell /bin/bash

USER bagels

RUN uv tool install --python 3.13 bagels

ENV PATH="$PATH:/home/bagels/.local/bin"

WORKDIR /home/bagels/data

ENTRYPOINT [ "bagels", "--at", "/home/bagels/data" ]
