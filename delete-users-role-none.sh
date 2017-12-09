#!/bin/bash
ddsh -a "user show list" | grep 'none' | awk {'system("ddsh -a \"ddboost user unassign " $1 "\" ; ddsh -a \"user del " $1 "\"")'}
