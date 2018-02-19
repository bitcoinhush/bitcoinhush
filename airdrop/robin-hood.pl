#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper;

my $total        = 0;
my $avg          = 0;
my $total_new    = 0;
my $avg_new      = 0;
my $total_taddrs = 0;

while (<>) {
    my ($original,$wrong,$taddr) = split ",";
	chomp $taddr;
	my $scale   = .09489946995;
	my $new     = $original * (1 - $scale);
	$total     += $original;
	$total_new += $new;
	print "$original,$new,$taddr\n";
	$total_taddrs++;
}

$avg     = sprintf "%f",$total     / $total_taddrs;
$avg_new = sprintf "%f",$total_new / $total_taddrs;
warn "total=$total, avg=$avg , $total_taddrs taddrs\n";
warn "total_new=$total_new, avg=$avg_new , $total_taddrs taddrs\n";
my $needed = 6675531.7743449;
my $diff = $needed - $total_new;
warn "Diff=$diff";
