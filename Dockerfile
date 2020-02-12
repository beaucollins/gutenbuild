FROM node:alpine

RUN mkdir /project

WORKDIR /project

COPY ./package.json .
RUN npm install

ENTRYPOINT ["npx", "wp-scripts"]