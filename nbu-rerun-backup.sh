#!/bin/sh
for ((j=1;j<5;j++)) do /usr/openv/netbackup/bin/bpbackup -i -p $1 ; done
