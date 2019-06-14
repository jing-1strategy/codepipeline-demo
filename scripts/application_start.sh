#!/usr/bin/env bash

cd /home/ec2-user/node
pm2 start --name sampleapp sampleapp.js 
pm2 save