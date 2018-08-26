#!/usr/bin/python
########################
#
#  bedPeaksToGff.py
#
#  Author: Lei Pinji
#
########################
import sys,os
peaks = sys.argv[1]
peaks_fh = open(peaks,'r')
col=[1,2,3,4,5,6,7,8,9]
for line in peaks_fh:
    array = line.split("\t")
    col[0] = array[0]
    col[1] = "peaks"
    col[2] = "bed"
    col[3] = array[1]
    col[4] = array[2]
    col[5] = "."
    col[6] = '+'
    col[7] = '1'
    col[8] = "Peaks"+" "+array[0]+":"+array[1]+"-"+array[2]
    print "\t".join(col)
    
