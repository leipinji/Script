#!/usr/bin/perl
#################################
# File name : select_gene_fpkm.pl
#Author: Lei Pinji
#Mail: LPJ@whu.edu.cn
#################################
use warnings;
use strict;

my ($gene_list, $fpkm) = @ARGV;
unless (@ARGV == 2) {
	print <<EOF;
	Usage : select_gene_fpkm.pl <gene-list> <*.fpkm>
	Description:
		gene-list file first column is geneSymbol name;
		*.fpkm file first column is geneSymbol name, and the rest column is genes expression level
		in each sample.
	##################################################################################################
EOF
exit(0);
	}
my %gene = ();

open my $gene_fh, "<",$gene_list or die;
open my $fpkm_fh, "<",$fpkm or die;

while (<$gene_fh>) {
	chomp;
	next if /^#/;
	my @tmp = split/\t/;
    my $gene_name = $tmp[0];
    $gene_name = uc($gene_name);
	$gene{$gene_name} = 1;	
	}

close $gene_fh;
while (<$fpkm_fh>) {
	chomp;
	next if /^#/;
	my @tmp = split/\t/;
    my $fpkm_name = $tmp[0];
    $fpkm_name = uc($fpkm_name);
	if (exists $gene{$fpkm_name}) {
		print join("\t",@tmp),"\n";
		}
	}

close $fpkm_fh;

