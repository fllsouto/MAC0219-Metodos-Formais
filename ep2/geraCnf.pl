#!/usr/bin/perl

use v5.10;
use FileHandle;
use strict;
use warnings;
use setOfClauses;

$, = " ;;; \n";
$" = " ,,, ";

if(@ARGV < 2){
    die "USO: ./geraCnf.pl <entrada> <saida>";
}

my $entrada = shift;
my $saida = shift;
my %hash;
my $count = 1;

open INPUT, "< $entrada";
open OUTPUT, "> $saida";

my @lines = <INPUT>;
close INPUT;

for(@lines){
    chomp; #remove o newline (\n)
    my @clausulas = split(/\) /); #separa cada um dos termos do predicado
    my $i;
    for($i = 0; $i < @clausulas - 1; $i++){ #adiciona o parenteses removidos durante o split
	$clausulas[$i] = $clausulas[$i].")";
    }
    chop($clausulas[$i]); #remove o ponto do ultimo termo do predicado
    foreach my $word (@clausulas){
	if (index($word, "-") != -1) { #checa se a string contem o caracter "-"
	    my $key = substr $word, 1;
	    if(!exists $hash{$word}){
		if(exists $hash{$key}){
		    $hash{$word} = -$hash{$key};
		}
		else{
		    $hash{$word} = -$count;
		    $count++;
		}
	    }
	}
	else{
	    my $neg = "-".$word;
	    if(!exists $hash{$word}){
		if(exists $hash{$neg}){
		    $hash{$word} = -$hash{$neg};
		}
		else{
		    $hash{$word} = $count;
		    $count++;
		}
	    }
	}
    }
    
   ####### PRINTS DE DEBUG ########
   # print "Separado: @clausulas";#
   # print "\n\n";                #
}

####### PRINTS DE DEBUG #################
#print "Hash maroto das gatinhas: \n";  #
#foreach my $aux (keys %hash){          #   
#    print "$aux ------> $hash{$aux}\n";#
#}

my $numClauses = $.;
my $numVars = 0;
foreach my $a (keys %hash){
    if (abs($hash{$a}) > $numVars){
	$numVars = abs($hash{$a});
    }
}
select OUTPUT;
print "c Versao cnf de $entrada\n";
print "c\n";
print "p cnf $numVars $numClauses\n";

for(@lines){
    my @clausulas = split(/\) /); #separa cada um dos termos do predicado
    my $i;
    for($i = 0; $i < @clausulas - 1; $i++){ #adiciona o parenteses removidos durante o split
	$clausulas[$i] = $clausulas[$i].")";
    }
    chop($clausulas[$i]); #remove o ponto do ultimo termo do predicado
    foreach my $word (@clausulas){
	print "$hash{$word} ";
    }
    print "0\n";
}
