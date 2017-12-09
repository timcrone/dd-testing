#!/bin/bash
ddsh -a "ddboost storage-unit show" | grep "RW" | grep "cronet" | awk {'system("ddsh -a \"ddboost storage-unit modify " $1 " user sysadmin \";ddsh -a \"ddboost storage-unit delete " $1 "\"")'}

ddsh -a "user show list" | grep 'none' | awk {'system("ddsh -a \"ddboost user unassign " $1 "\" ; ddsh -a \"user del " $1 "\"")'}
