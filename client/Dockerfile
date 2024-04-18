FROM node:20-alpine

# update is required before installing any alpine packages
RUN apk update

RUN apk add git

# bash is needed for scripty
RUN apk add bash

RUN git clone https://github.com/dinhero21/node-minecraft-fuzzer.git
WORKDIR /node-minecraft-fuzzer

# Install dependencies
RUN npm ci

# Transpile TypeScript
RUN npm run build

ENV HOST=server
ENV INTERVAL=100

CMD ["npm", "run", "run"]
