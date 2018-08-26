#!/usr/bin/bash
#########################
#
#  parse_memeAME.sh
#
#  Author: Lei Pinji
#
#########################
file=$1
output=${file/.txt/_motif_pvalue.txt}
awk 'BEGIN{OF=" ";OFS="\t"}{print $6,$12}' $file > $output
sed -n '13,$'p $output > tmp
mv tmp $output
