#!/bin/bash
#########################
#
#  txt2xlsx.sh
#
#  Author: Lei Pinji
#
#########################
for file in `ls`
do
    if [[ $file =~ ".txt" ]];then
        txt2xlsx.R $file ${file/.txt/.xlsx}
fi
done
