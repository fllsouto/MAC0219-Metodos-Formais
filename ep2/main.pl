#!/usr/bin/perl

use v5.10;
use FileHandle;
use strict;
use warnings;

if (@ARGV < 1){	die "Falta arquivo de entrada!"}
my $input = $ARGV[0];
my $handle = FileHandle->new;
$handle->open("<$input");

my %variables;
my %sentences;

while (my $line = <$handle>){
    given($line){
	when($line =~ /^([A-Z]+):\s([0-9]+)\s([0-9]+).$/){
	    my $variavelCapturada = $1; #identifica o nome da variavel
	    my $rangeList = [$2, $3]; #cria uma (referencia para) lista com o range da variavel
	    $variables{$variavelCapturada} = $rangeList; #associa a variavel a seu range
	    # print "----Variavel----\n";
	    # print "Texto :" .$line ."\n";
	    # print "Variavel : $1\n";
	    #print "Range : ($2 ~ $3)\n";
	    #print "-----------------\n";	
	}
	when($line =~ /^(-?[a-z]+[\(]([A-Z]+)(,\s*([A-Z]+))*?[\)]\s*)+.((\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*\s(<|>|>=|<=|==|!=)\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*)*[\.])?$/){
	    
	    #print "----Predicado----\n";
	    print "Texto :" .$line ."\n";
	    print "Grupo 1 : $1\n";
	    print "Grupo 2 : $2\n";
	    print "Grupo 3 : $3\n";
	    print "Grupo 4 : $4\n";
	    print "Grupo 5 : $5\n";
	    print "Grupo 6 : $6\n";
	    print "Grupo 7 : $7\n";
	    print "Grupo 8 : $8\n";
	    print "Grupo 9 : $9\n";
	    #print "-----------------\n";	
	}
	#when($line =~/^[\.]((\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*\s(<|>|>=|<=|==|!=)\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*)*[\.])?$/){
	    #print "----Restritor----\n";
	    #print "Texto :" .$line ."\n";
	    #print "Grupo 1 : $1\n";
	    #print "-----------------\n";	
	#}
	default{
	    print "----ERRO----\n";
	    print "Texto :" .$line ."\n";
	    print "-----------------\n";	
	}
    }
}

$handle->close;

