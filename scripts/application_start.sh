#!/usr/bin/env bash

cd ~/node
# pm2 start bin/www -n www -i 0
pm2 start --name sampleapp sampleapp.js 
pm2 save