#!/usr/bin/env bash
# Author:  Sam Saccone and Dan Bough (daniel.bough <at> gmail <dot> com / www.danielbough.com)
# License:  GPLv3
# Copyright 2013

# Change this to the version of Ghost you want to install.
# Untested with versions outside of 0.3.2.
VERSION=0.3.2

# Only run the following if this is the first time running.
if [ ! -f /var/log/firsttime ]
then
  touch /var/log/firsttime
  apt-get update

  # Get the latest version of Node.
  apt-get -y install python-software-properties python g++ make
  add-apt-repository ppa:chris-lea/node.js
  apt-get update
  apt-get -y install nodejs

  # Get Ghost and unzip it.
  mkdir -p /var/www
  apt-get install unzip
fi

cd /var/www
wget https://github.com/mojotech/m-blog/archive/master.zip
unzip -o master.zip

# simlink the downloaded file
ln -nfs /var/www/m-blog-master /var/www/ghost
cd /var/www/ghost

sed -i 's/127.0.0.1/0.0.0.0/g' config.js

# manually build sqlite
# http://www.codyhatch.com/ghost-and-amazon-ami-sqlite3-issue-resolved/
sudo npm install -g node-gyp
sudo npm install sqlite3 --build-from-source

# Install Ghost.
npm install --production

# Run via an INIT job.
if [ ! -f /etc/init/ghost.conf ]
then
  cp /home/vagrant/shared/ghost.conf /etc/init/
  service ghost start
fi
