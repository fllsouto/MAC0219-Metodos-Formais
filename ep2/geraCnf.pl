#!/usr/bin/perl

use v5.10;
use FileHandle;
use strict;
use warnings;
use setOfClauses;

$, = " ;;; \n";
$" = " ,,, ";

my $entrada = shift;
my %hash;
my $count = 1;

open INPUT, "< $entrada";

my @lines = <INPUT>;

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

    print "Separado: @clausulas";
    print "\n\n";
}

print "Hash maroto das gatinhas: \n";
foreach my $aux (keys %hash){
    print "$aux ------> $hash{$aux}\n";
}

print "Numero de clausulas: $.";
my $numClauses = $.;

print "REDO:";

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
