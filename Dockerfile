# get node in ubuntu ref. https://askubuntu.com/a/720814/22308
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y curl

ENV NODE_VERSION=8
ENV NODE_VERSION=12
RUN curl -sL "https://deb.nodesource.com/setup_$NODE_VERSION.x" | bash
RUN apt-get install -y nodejs
RUN npm install -g yarn

# install package
#RUN yarn install

CMD tail -f 2>&1 1>/dev/null