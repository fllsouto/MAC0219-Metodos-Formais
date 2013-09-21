#!/usr/bin/perl
use v5.10;
use strict;
use warnings;

my @string = split(' ', <>);# nao precisa do aspas
chomp (@string);
my @string2 = @string;

for (my $a = 0; $a < scalar @string; $a++) {
	if(not ($string[$a] =~ /^-[1-9]{1,3}/)){
		print "$string[$a] \n";
	}

}
