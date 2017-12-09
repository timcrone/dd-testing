#!/bin/bash
while [ 1 ] ; do ip6tables -I INPUT 1 -p tcp --dport 2049 -j DROP ; echo "Rule added: `date`" ; sleep $(($RANDOM % 300)) ; ip6tables -D INPUT 1 ; echo "Rule dropped: `date`" ; sleep $(($RANDOM % 300)) ; done
