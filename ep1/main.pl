#!/usr/bin/perl

use v5.10;
use nxnArray;
use strict;
use warnings;

if(@ARGV < 3){
   die "Uso:\n./main.pl <arquivoDeEntrada> <arquivoCNF>  <arquivoRespota>\n";
}

my $input = $ARGV[0];
my $output = $ARGV[1];
my $answer = $ARGV[2];

open INPUT, "< $input";
open OUTPUT, "> $output";

my @string = split(' ', <INPUT>);# nao precisa do aspas

close INPUT;

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

close OUTPUT;


#caso nao execute, retirar o ./ da linha 40
`./minisat $output $answer`;
system('./filtro.pl '.$answer);



