#!/bin/bash
unalias cp
cp -rf /webapps/configurations/nginx.conf /etc/nginx/nginx.conf
nginx -s reload