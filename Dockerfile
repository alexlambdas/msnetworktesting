FROM node:14.16.0-alpine3.10

# network tools for docker images on node:alpine

RUN apk update

RUN apk add busybox-extras 

RUN apk --no-cache add curl vim wget bash

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package.json ./

USER node

ADD dist ./dist

RUN npm install --only=prod

COPY . .

EXPOSE 8080

CMD [ "node", "./dist/main.js" ]