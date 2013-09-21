#!/usr/bin/perl

use v5.10;
use nxnArray;
use strict;
use warnings;

if(@ARGV < 2){
   die "Uso:\n./main.pl <arquivoDeEntrada> <arquivoDeSaida>\n";
}

my $input = $ARGV[0];
my $output = $ARGV[1];

open INPUT, "< $input";
open OUTPUT, "> $output";

my @string = split(' ', <INPUT>);# nao precisa do aspas


my $mat = new nxnArray();
select OUTPUT;
$mat->readInput(@string);
$mat->insertTips();
$mat->regionExistence();
$mat->lineExistence();
$mat->columnExistence();
$mat->permuteTips();
$mat->subSquare();
$mat->highlanderLine();
$mat->highlanderColumn();
$mat->printFNC();

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



