#!/usr/bin/perl

use v5.10;
use nxnArray;
use strict;
use warnings;

my @string = split(' ', <>);# nao precisa do aspas


my $mat = new nxnArray();
print "c Sudoku\nc\np cnf 729 8748\n";
$mat->readInput(@string);
#$mat->columnExistence();
#$mat->lineExistence();
#$mat->regionExistence();
$mat->regionUniqueness();
$mat->lineUniqueness();
$mat->columnUniqueness();


#####################################################################################
#####################################################################################
#####################################################################################

# foreach $a (1..9){
# 	$mat->createMatrix($a);
# }

# $mat->pointRmv();

# my $val1 = 0;
# my $val2 = 1;
# my $st = join('x', $val1,$val2);
# my $bye = $mat->retHash($st); 
# print ">> $bye \n";
#print "valor : $st\n";

# $mat->horizontalRmv();
# $mat->verticalRmv();
# $mat->zoneRmv(1,2);
# foreach $a (0..9){
# 	$mat->printMatrix($a);
# }



