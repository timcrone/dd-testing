#!/bin/sh
# esx-reset-tools-mount.sh <disk name> <nfs server> <nfs path>
esxcli storage nfs remove -v $1 ; esxcli storage nfs add -H $2 -s $3 -v $1 -r
