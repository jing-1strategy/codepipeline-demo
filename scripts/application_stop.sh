#!/bin/bash
kill -9 $(ps aux | grep '\snode\s' | awk '{print $2}')