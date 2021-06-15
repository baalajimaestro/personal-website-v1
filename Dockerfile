FROM alpine:edge

RUN apk add git curl bash --no-cache --update

RUN curl -sLo hugo-0.83.1.tar.gz "https://github.com/gohugoio/hugo/releases/download/v0.83.1/hugo_extended_0.83.1_Linux-64bit.tar.gz" \
    && tar -xf hugo-0.83.1.tar.gz \
    && mv hugo /usr/bin/hugo \
    && rm -rf LICENSE README.md hugo-0.83.1.tar.gz

COPY . /app
RUN cd /app && git submodule update --init --recursive
RUN git clone https://github.com/baalajimaestro/personal-website -b master /public

RUN git config --global user.email "me@baalajimaestro.me"
RUN git config --global user.name "baalajimaestro"

WORKDIR /app

CMD ["bash", "push.sh"]