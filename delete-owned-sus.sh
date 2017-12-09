#!/bin/bash
ddsh -a "ddboost storage-unit show" | grep "RW" | grep $1 | awk {'system("ddsh -a \"ddboost storage-unit modify " $1 " user sysadmin \";ddsh -a \"ddboost storage-unit delete " $1 "\"")'}
