#!/bin/sh
/usr/openv/netbackup/bin/bpps | awk '{print $2}' | xargs kill -9
