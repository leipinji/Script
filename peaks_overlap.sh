#!/bin/bash
if [[ $# -lt 1 ]];then
echo "Usage: $0 <bed1>	<bed2>	<overlap bed>"
exit 0
fi

intersectBed -a $1 -b $2 -u -f 0.1 -r> $3

