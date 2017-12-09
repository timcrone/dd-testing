#!/bin/bash
ddsh -a "replication status" | grep /data/col1 | awk {'system("ddsh -a \"replication break " $2"\"")'}

ddsh -a "smt tenant-unit show list" | awk {'system("ddsh -a \"mtree list tenant-unit " $1"\" | grep /data/col1")'} | awk {'system("ddsh -a \"mtree modify " $1"\" tenant-unit none;ddsh -a \"mtree del " $1"\"")'}

# be careful with this:
ddsh -a "mtree list" | grep /data/col1/ | grep "RW\|RO" | awk '{print "ddsh -a \"mtree del " $1"\""}'
ddsh -a "filesys clean start"
ddsh -a "filesys clean watch"

ddsh -a "user show list" | awk {'system("ddsh -a \"user del " $1 "\"")'}

ddsh -a "smt tenant-unit show list" | awk {'system("ddsh -a \"smt tenant-unit destroy " $1"\"")'}

ddsh -a "smt tenant show list" | awk {'system("ddsh -a \"smt tenant destroy " $1 "\"")'}
