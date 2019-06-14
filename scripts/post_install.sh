#!/usr/bin/env bash
set -e

cd /home/ec2-user/node
npm install

# sed '$d' /etc/nginx/conf.d/ssl.conf > /etc/nginx/conf.d/temp.conf
head -n -5 /etc/nginx/conf.d/ssl.conf > /etc/nginx/conf.d/temp.conf
yes | mv /etc/nginx/conf.d/temp.conf /etc/nginx/conf.d/ssl.conf

cat <<EOF >> /etc/nginx/conf.d/ssl.conf
location / {
                  proxy_pass http://0.0.0.0:8080;
                  proxy_http_version 1.1;
              }
          }
EOF

nginx -t && nginx -s reload
