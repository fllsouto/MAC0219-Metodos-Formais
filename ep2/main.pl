#!/usr/bin/perl

use v5.10;
use FileHandle;
use strict;
use warnings;

if (@ARGV < 1){	die "Falta arquivo de entrada!"}
my $input = $ARGV[0];
my $handle = FileHandle->new;
$handle->open("<$input");



while (my $line = <$handle>){
	given($line){
		when($line =~ /^([A-Z]+):\s([0-9]+)\s([0-9]+).$/){
			print "----Variavel----\n";
			print "Texto :" .$line ."\n";
			print "Variavel : $1\n";
			print "Range : ($2 ~ $3)\n";
			print "-----------------\n";	
		}
		when($line =~ /^(-?[a-z]+[\(]([A-Z]+)(,\s[A-Z]+)*?[\)]\s)+.$/){
			print "----Predicado----\n";
			print "Texto :" .$line ."\n";
			print "Grupo 1 : $1\n";
			print "Grupo 2 : $2\n";
			print "-----------------\n";	
		}
		when($line =~/^[\.]((\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*\s(<|>|>=|<=|==|!=)\s([A-Z]+)(\s(\+|\-|\*|\/)\s[A-Z]+)*)*[\.])?$/){
			print "----Restritor----\n";
			print "Texto :" .$line ."\n";
			print "Grupo 1 : $1\n";
			print "-----------------\n";	
		}
		default{
			print "----ERRO----\n";
			print "Texto :" .$line ."\n";
			print "-----------------\n";	
		}
	}
};

$handle->close;

