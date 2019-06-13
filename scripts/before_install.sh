#!/usr/bin/env bash
set -e

# add nodejs to yum
curl -sL https://rpm.nodesource.com/setup_10.x | bash -
yum -y install nodejs 

# install pm2 module globaly
npm install -g pm2
pm2 update

# # update default nginx.conf
# unalias cp
# cp -rf /webapps/configurations/nginx.conf /etc/nginx/nginx.conf
# nginx -s reload