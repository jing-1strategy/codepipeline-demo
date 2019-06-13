#!/usr/bin/env bash
cd ~/node
pm2 stop www || true

# kill -9 $(ps aux | grep '\snode\s' | awk '{print $2}')