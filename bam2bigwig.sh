#!/bin/bash
#########################
#
#  bam2bigwig.sh
#
#  Author: Lei Pinji
#
#########################
if [[ $# -lt 1 ]];then
echo "Usage: $0 <bam>"
exit 0
fi

bam=$1
output=${bam/.bam/.bigwig}
bamCoverage --bam $bam --outFileName $output --outFileFormat bigwig --binSize 10 --normalizeUsing RPKM --ignoreDuplicates
