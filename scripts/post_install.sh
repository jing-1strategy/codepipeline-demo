#!/usr/bin/env bash
set -e

cd ~/node
npm install

yes | cp -rf /webapps/configurations/nginx.conf /etc/nginx/nginx.conf
nginx -s reload