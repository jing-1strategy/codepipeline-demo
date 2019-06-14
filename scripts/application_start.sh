#!/usr/bin/env bash

cd /home/ec2-user/node
pm2 start --name sampleapp /home/ec2-user/node/sampleapp.js 