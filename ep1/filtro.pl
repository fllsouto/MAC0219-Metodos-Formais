#!/usr/bin/perl
use v5.10;
use strict;
use warnings;

my @string = split(' ', <>);# nao precisa do aspas
chomp (@string);
my @string2;
for (my $a = 0; $a < scalar @string; $a++) {
	if(not ($string[$a] =~ /^-[1-9]{1,3}/)){
		my $item = $string[$a];
		push (@string2,$item);

	}

}

# for (my $a = 0; $a < scalar @string2; $a++) {
# 	print "$string2[$a] \n";
# }

readInput(@string2);


sub readInput{
    my @string = @_;
    my $a = 0;

    for (my $a = 0; $a < scalar @string - 1; $a++) {
    	my $waka = $string[$a] % 9;
    	if ($waka != 0) {
    		print "$waka  ";
    	} else {
    		print "9  ";
    	}
    	if ((($a+1) % 9) == 0){
    		print "\n\n";
    	}

    }

}