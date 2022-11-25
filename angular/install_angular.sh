#!/bin/bash

sudo apt-get install software-properties-common
curl -sL https://deb.nodesource.com/setup_18.x  | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install npm@latest -g
sudo npm install -g @angular/cli
node --version
