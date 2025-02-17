FROM python:3.13-alpine

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

ARG UID=1000

USER root

RUN addgroup -S bagels && adduser -S bagels -u $UID -G bagels

USER bagels

RUN uv tool install --python 3.13 bagels

ENV PATH="$PATH:/home/bagels/.local/bin"
ENV TERM="xterm-256color"
ENV COLORTERM="truecolor"

WORKDIR /home/bagels/data

ENTRYPOINT [ "bagels", "--at", "/home/bagels/data" ]
