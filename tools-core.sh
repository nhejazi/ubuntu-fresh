#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root"
  exit
fi


# NodeJS install
apt-key adv --keyserver keyserver.ubuntu.com --recv 68576280
apt-add-repository "deb https://deb.nodesource.com/node_5.x $(lsb_release -sc) main"
apt-get update -y
apt-get install -y nodejs


# Hugo (modern static site generator)
echo "Installing Hugo v0.32 \nCHECK this is the most recent stable release."
wget https://github.com/gohugoio/hugo/releases/download/v0.32/hugo_0.32_Linux-64bit.deb
dpkg -i hugo_0.32_Linux-64bit.deb


# asciinema (terminal recorder) install
apt-add-repository ppa:zanchey/asciinema
apt-get update -y
apt-get install -y asciinema


# add some global tools from NodeJS
npm install -g hpm-cli  # package/plug-in manager for Hyper (terminal)
npm install -g now  # modern and simple web management tool by ZEIT


# fix installation issues arising from dependencies
apt-get install -f -y
echo "If any dependency warnings appeared, run this script a second time."
