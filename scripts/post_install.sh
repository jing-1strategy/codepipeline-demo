#!/usr/bin/env bash
set -e

cd /home/ec2-user/node
npm install

sed '$d' /etc/nginx/conf.d/ssl.conf

cat <<EOF >> /etc/nginx/conf.d/ssl.conf
location / {
                  proxy_pass http://0.0.0.0:8080;
                  proxy_http_version 1.1;
                  proxy_set_header Upgrade $http_upgrade;
                  proxy_set_header Connection 'upgrade';
                  proxy_set_header Host $host;
                  proxy_cache_bypass $http_upgrade;
              }
          }
EOF

nginx -t && nginx -s reload
