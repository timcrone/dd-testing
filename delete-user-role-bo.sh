#!/bin/bash
ddsh -a "ddboost set user-name sysadmin" ; ddsh -a "user show list" | grep 'backup-operator' | awk {'system("ddsh -a \"ddsh -a \"user del " $1 "\"")'}
