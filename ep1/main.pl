#!/usr/bin/perl

use v5.12;
use nxnArray;
use strict;
use warnings;

my @string = split(' ', <>);
my $a;


my $mat = new nxnArray();
# foreach $a (1..9){
# 	$mat->createMatrix($a);
# }

# $mat->readInput(@string);

# $mat->pointRmv();

my $val1 = 0;
my $val2 = 1;
my $st = join('x', $val1,$val2);
my $bye = $mat->retHash($st); 
print ">> $bye \n";
#print "valor : $st\n";

# $mat->horizontalRmv();
# $mat->verticalRmv();
# $mat->zoneRmv(1,2);
# foreach $a (0..9){
# 	$mat->printMatrix($a);
# }


