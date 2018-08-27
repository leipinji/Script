#!/usr/bin/perl
####################
#
#  homer.peaks.annotation.pl
#
#  Author: Lei Pinji
#
####################
use strict;
use warnings;
use Getopt::Long;

my ($peaks_annotate,$genome_element,$tss,$output,$help);
my %opt;

GetOptions(\%opt,
    "peaks=s"   => \$peaks_annotate,
    "element=s" => \$genome_element,
    "help"    => \$help,
);

if ($help) {
        print<<EOF;
        Usage: $0 -peaks [peaks annotated] -element [output genome element]
EOF
        exit(0);
    }

open my $peaks_annotate_fh, "<", $peaks_annotate or die "can not open peaks annotate file\n";
open my $element_fh, ">",$genome_element or die "can not open genome element file\n";

# genome element
my ($promoter_tss,$exon,$intron,$utr3,$utr5,$intergenic,$tts) = (0,0,0,0,0,0,0);

# output refgene with peaks in promoter region
open my $UTR3_fh, ">","3-UTR" or die;
open my $UTR5_fh, ">","5-UTR" or die;
open my $intergenic_fh, ">","intergenic" or die;
open my $intron_fh, ">","intron" or die;
open my $exon_fh, ">", "exon" or die;
open my $promoter_tss_fh, ">","promoter_tss" or die;
open my $tts_fh, ">", "tts" or die;


while (<$peaks_annotate_fh>) {
        chomp;
        next if /^PeakID/;
        my @tmp = split/\t/;
        # genome element
        my $element = $tmp[7];
        # 3' UTR
        # 5' UTR
        # Intergenic
        # intron
        # exon
        # non-coding
        # promoter-TSS
        # TTS
        my $distance = $tmp[9];
        next if $element =~ m/NA/;

        if (($element =~ /^promoter-TSS/) or ($distance >= -1000 and $distance <= 1000)) {
            $promoter_tss += 1;
			print $promoter_tss_fh $_,"\n";
        }
        else {
            if ($element =~ /^3'\sUTR/) {
				$utr3 += 1;
				print $UTR3_fh $_, "\n";
				}

            if ($element =~ /^5'\sUTR/) {
				$utr5 += 1;
				print $UTR5_fh $_,"\n";
				}

            if ($element =~ /^Intergenic/) {
				$intergenic += 1;
				print $intergenic_fh $_,"\n";
				}

            if ($element =~ /^intron/) {
				$intron += 1;
				print $intron_fh $_,"\n";
				}

            if ($element =~ /^exon/) {
				$exon += 1;
				print $exon_fh $_,"\n";
				}
				
            if ($element =~ /^non-coding.*exon/) {
				$exon +=1;
				print $exon_fh $_,"\n";
				}

            if ($element =~ /^TTS/) {
				$tts += 1;
				print $tts_fh $_,"\n";
				}
        }
        }

my $element_file=<<EOF;
Promoter_TSS    $promoter_tss
UTR_3   $utr3
Exon    $exon
Intron  $intron
UTR_5   $utr5
TTS $tts
Intergenic  $intergenic
EOF
print $element_fh $element_file;

system("mkdir homer.anno");
system("mv 3-UTR homer.anno/");
system("mv 5-UTR homer.anno/");
system("mv intergenic homer.anno/");
system("mv intron homer.anno/");
system("mv exon homer.anno/");
system("mv promoter_tss homer.anno/");
system("mv tts homer.anno/");

