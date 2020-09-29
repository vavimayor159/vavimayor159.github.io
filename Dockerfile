FROM node:12-alpine

ENV APP_HOME /usr/src/app

RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Python is required for node-gyp
RUN apk update
RUN apk add python build-base git

COPY package.json $APP_HOME
RUN npm install

# build node-compatabile version
COPY . $APP_HOME/
#RUN yarn install

USER $RUN_USER
EXPOSE 8080
CMD npm start
