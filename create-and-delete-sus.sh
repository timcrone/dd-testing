#!/bin/bash
while [ 1 ] ; do for ((i=1; i<50; i++)) ; do ddsh -a ddboost storage-unit create $i user sysadmin ; done ; for ((i=1; i<50; i++)) ; do ddsh -a ddboost storage-unit delete $i ; done ; ddsh -a filesy clean start ; ddsh -a filesys clean watch ; done
