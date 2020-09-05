# get node in ubuntu ref. https://askubuntu.com/a/720814/22308
FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y curl

ENV NODE_VERSION=8
ENV NODE_VERSION=12
RUN curl -sL "https://deb.nodesource.com/setup_$NODE_VERSION.x" | bash
RUN apt-get install -y nodejs
RUN npm install -g yarn


# create & set THIS_APP folder
WORKDIR /app

# invalidate-tag for node_modules/ ie update the tag to force a rerun from this step
RUN echo 191020_b

# install app packages
COPY ./package.json .
COPY ./yarn.lock    .
RUN rm -rf ./node_modules/
RUN yarn install

# bundle app source
COPY .         .
#    APP_HOME  /app in container

# set api port to serve at
EXPOSE 3000

# serve as api app
CMD yarn start

# used when debug
#CMD tail -F `mktemp`
