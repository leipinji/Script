#!/bin/bash
#########################
#
#  peaks_distribution.sh
#
#  Author: Lei Pinji
#
#########################
homer.peaks.annotation.pl -peaks $1 -element ${1/.txt/_distribution.txt}
