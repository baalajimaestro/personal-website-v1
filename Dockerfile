FROM fedora:34

ENV HUGO_VERSION=0.88.1

RUN dnf -y -q update && dnf -y -q install curl git bash

RUN curl -sLo hugo-${HUGO_VERSION}.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.tar.gz" \
    && tar -xf hugo-${HUGO_VERSION}.tar.gz \
    && mv hugo /usr/bin/hugo \
    && rm -rf LICENSE README.md hugo-${HUGO_VERSION}.tar.gz

COPY . /app
RUN cd /app && git submodule update --init --recursive
RUN git clone https://github.com/baalajimaestro/personal-website -b master /public

RUN git config --global user.email "me@baalajimaestro.me"
RUN git config --global user.name "baalajimaestro"

WORKDIR /app

CMD ["bash", "push.sh"]
