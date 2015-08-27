FROM ubuntu

# File Author / Maintainer
MAINTAINER Fabian Mueller

# Install Node.js and other dependencies
RUN apt-get update && \
    apt-get -y install curl && \
    curl -sL https://deb.nodesource.com/setup | sudo bash - && \
    apt-get -y install python build-essential nodejs

# Install nodemon
RUN npm install -g nodemon

RUN mkdir /etc/docker-node-test
WORKDIR /etc/docker-note-test
ADD package.json package.json
RUN npm install

ADD test test
ADD src src

# Expose port
EXPOSE  8080

# Run app using nodemon
CMD ["nodemon", "/src/index.js"]
