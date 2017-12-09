#!/bin/bash
ddsh -a "ddboost storage-unit show" | grep "RW" | grep "cronet" | awk {'system("ddsh -a \"ddboost storage-unit delete " $1 "\" password abc123")'}

ddsh -a "ddboost set user-name sysadmin" ; ddsh -a "user show list" | grep 'backup-operator' | awk {'system("ddsh -a \"ddsh -a \"user del " $1 "\"")'}
