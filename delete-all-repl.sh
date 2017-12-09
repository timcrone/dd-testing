#!/bin/bash
ddsh -a "replication status" | grep /data/col1 | awk {'system("ddsh -a \"replication break " $2"\"")'}
