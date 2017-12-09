@!/bin/bash
for ((j=1;j<$1;j++)); do for ((i=1;i<16;i++)) do ddsh -a disk unfail $j.$i ; done ; done
