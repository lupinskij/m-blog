FROM mojo/m-docker-node
MAINTAINER mojotech

ADD . /ghost
RUN cd /ghost; npm install --production

EXPOSE 8080

WORKDIR /ghost
ENTRYPOINT ["npm", "start"]
