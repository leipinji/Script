#!/bin/bash
#########################
#
#  bamSortAndIndex.sh
#
#  Author: Lei Pinji
#
#########################
if [[ $# -lt 1 ]];then
echo "Usage: $0 <bam>"
echo "Example: output sample.srt.bam sample.srt.bam.bai"
exit 0
fi

bam=$1
samtools sort $bam -o ${bam/.bam/.srt.bam}
samtools index ${bam/.bam/.srt.bam}

