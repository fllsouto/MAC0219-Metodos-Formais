#!/usr/bin/perl

use v5.10;
use FileHandle;
use strict;
use warnings;
use setOfClauses;

if (@ARGV < 1){	die "Falta arquivo de entrada!"}
my $input = $ARGV[0];
my $handle = FileHandle->new;
$handle->open("<$input");

$, = " ;;;; ";
$" = " ::: ";

my $objeto = new setOfClauses();
while (my $line = <$handle>){
    given($line){
    	# print $line."\n";
	when($line =~ /^([A-Z]+):\s([0-9]+)\s([0-9]+).$/){
	    my $variavelCapturada = $1; #identifica o nome da variavel
	    my $rangeList = [$2, $3]; #cria uma (referencia para) lista com o range da variavel
	    $objeto->addVariables($variavelCapturada, $rangeList); #associa a variavel a seu range

	    #### PRINTS PARA DEBUG #########
	    # print "----Variavel----\n";  #
	    # print "Texto :" .$line ."\n";#
	    # print "Variavel : $1\n";     #
	    # print "Range : ($2 ~ $3)\n"; #
	    # print "-----------------\n"; #	
	}

	# when($line =~ /^(-?[a-z]+[\(]([A-Z]+)(,\s*([A-Z]+))*?[\)]\s*)+.((\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*\s(<|>|>=|<=|==|!=)\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*)*[\.])?$/){

	when($line =~ /^(-?[a-z]+[\(]([A-Z]+)(,\s*([A-Z]+))*[\)]\s?)+./){

	    my @predicates = $line =~ /(-?[a-z]+[(][A-Z,\s]+[)])+\s?/g;
	    my $predicatesList = [@predicates];
	    chomp ($line);
	    my @auxiliar = split(/\./, $line); #separa predicados de restritores, visto que esses sao separados por ponto
	    my @restritores;
	    if (exists $auxiliar[1]){
	    	@restritores = split(",", $auxiliar[1]); #cria um vetor em que cada elemento eh uma restricao do predicado
	    }
	    else{
	    	@restritores = "null";
	    }
	    my $restritoresList = [@restritores]; #cria um escalar que contem a lista de restritores
	    
	    ### PRINTS DE DEBUG ##############
	    # print "LINHA: $line \n\n";           #
	    # # print "AUX: @auxiliar \n\n";           #
	    # print "PREDICADOS: @predicates \n\n";#
	    # print "RESTRITORES: @restritores.\n";         #
	    # print "><"x30 . "\n";         #

	    $objeto->addPredicateList($predicatesList,$restritoresList);
	    
	}
	# #when($line =~/^[\.]((\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*\s(<|>|>=|<=|==|!=)\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*)*[\.])?$/){
	default{
	    print "----ERRO----\n";
	    print "Texto :" .$line ."\n";
	    print "-----------------\n";	
	}
    }
}
# $objeto->printVariablesList();
# $objeto->printClausesList();
$objeto->writeClauses();

$objeto->showInstances();
$handle->close;

