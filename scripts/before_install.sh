#!/bin/bash
sudo su
yes | cp -rf /webapps/configurations/nginx.conf /etc/nginx/nginx.conf
nginx -s reload