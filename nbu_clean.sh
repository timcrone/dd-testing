#!/bin/sh

# DNS
cp /etc/resolv.conf /tmp/resolv.conf
cat /tmp/resolv.conf | grep -v nameserver > /tmp/resolv.conf.new
#echo nameserver X.X.X.X >> /tmp/resolv.conf.new
#echo nameserver X.X.X.X >> /tmp/resolv.conf.new
cp /tmp/resolv.conf.new /etc/resolv.conf

cd /usr/openv/netbackup/bin/admincmd
./nbstlutil list -b | awk {'system("./nbstlutil cancel -backupid " $1)'}
./nbdelete -allvolumes -force
yes | ./bpexpdate -stype DataDomain -force_not_complete
./bppllist | awk '{system("./bppldelete " $1)}'
./nbstl -b | awk {'system("./nbstl " $1 " -delete")'}
./bpstulist | awk '{system("./bpstudel -label " $1)}'
./nbdelete -allvolumes -force
./nbdevquery -listdp | awk '{system("./nbdevconfig -deletedp -stype DataDomain -force_targetslp_removal -dp " $2)}'
./nbdevquery -liststs | awk '{system("./nbdevconfig -deletests -stype DataDomain -storage_server " $2)}'
./bpdbjobs -clean -keep_days 0
../../../volmgr/bin/tpconfig -dsh | tr '\n' ' ' | sed -e 's/\=\+/\n/g' | grep \\w | awk '{system("../../../volmgr/bin/tpconfig -delete -stype DataDomain -sts_user_id " $9 " -storage_server " $6)}'
yes | ../bp.kill_all
/usr/openv/netbackup/bin/bpps | awk '{system("kill -9 " $2)}'
../bp.start_all

# KNOWN ISSUE - history of AIR jobs does not get cleaned by the current script
