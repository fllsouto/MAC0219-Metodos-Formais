#!/usr/bin/perl

use v5.12;
use strict;
use warnings;

package nxnArray;

sub new{
	my $class = shift;
	my $self = {
		0 => [],
		1 => [],
		2 => [],
		3 => [],
		4 => [],
		5 => [],
		6 => [],
		7 => [],
		8 => [],
		9 => [],
		reg1 => [
			[0,0],
			[0,1],
			[0,2],
			[1,0],
			[1,1],
			[1,2],
			[2,0],
			[2,1],
			[2,2]

		],
		reg2 => [
			[0,3],
			[0,4],
			[0,5],
			[1,3],
			[1,4],
			[1,5],
			[2,3],
			[2,4],
			[2,5]

		],
		reg3 => [
			[0,6],
			[0,7],
			[0,8],
			[1,6],
			[1,7],
			[1,8],
			[2,6],
			[2,7],
			[2,8]

		],
		1x1 => "Parabens"

	};

	bless $self, $class;
	print "Ins OK! \n";
	return $self;
}

sub createMatrix{
	my $self = shift;
	my $indx = shift;
	my $i = 0;
	my $j = 0;
	my $a = 0;
	for(; $a < 81; $a++,$j++){
		if($j == 9){
			$j = 0;
			$i++;
		}
	    $self->{$indx}[$i][$j] = $indx;
	}
}

sub printMatrix{
	my $self = shift;
	my $index = shift;
	print "Aqui #$index\n\n";
	for(my $i = 0; $i < 9; $i++){
	   for(my $j = 0; $j < 9; $j++){
	      print "$self->{$index}[$i][$j] ";
	   }
	print "\n";
	}
	print "\n";
}

sub readInput{
	my $self = shift;
	#Facepalm!
	my @string = @_;
	my $a = undef;
	my $i = 0;
	my $j = 0;

	use integer;
	for($a = 0; $a < 81; $a++,$j++){
		if($j == 9){
			$j = 0;
			$i++;
		}
	    $self->{0}[$i][$j] = $string[$a];
	    #print "#$a($i , $j) $string[$a] X $self->{0}[$i][$j]\n";
	}
}

#Dado um i,j e um valor F, este e descartado
sub discartPos{
	my $self = shift;
	my $i = shift;
	my $j = shift;
	my $mtxNumber = shift;
	

	#print "Index escolhido : $index \n";
	$self->{$mtxNumber}[$i][$j] = "X";
}
#remove as coordenadas das dicas
sub pointRmv {
	my $self = shift;
	my $index = undef;
	for (my $i = 0; $i < 9; $i++) {
		for (my $j = 0; $j < 9; $j++) {
			if (($index = $self->{0}[$i][$j]) != 0) {
				for (my $k = 1; $k <= 9; $k++) {
					if ($index != $self->{$k}[$i][$j]) {
						discartPos($self,$i,$j,$k);
					}
				}
			}
		}
	}
}
#Remocao horizontal, aka coluna
sub horizontalRmv{
	my $self = shift;
	my $index = undef;
	for (my $i = 0; $i < 9; $i++) {
		for (my $j = 0; $j < 9; $j++) {
			if (($index = $self->{0}[$i][$j]) != 0) {
				for (my $k = 0; $k < 9; $k++) {
					if ($k != $j) {
						discartPos($self,$i,$k,$index);
					}
				}
			}
		}
	}

}

sub verticalRmv{
	my $self = shift;
	my $index = undef;
	for (my $i = 0; $i < 9; $i++) {
		for (my $j = 0; $j < 9; $j++) {
			if (($index = $self->{0}[$i][$j]) != 0) {
				for (my $k = 0; $k < 9; $k++) {
					if ($k != $i) {
						discartPos($self,$k,$j,$index);
					}
				}
			}
		}
	}

}

sub zoneRmv{
	my $self = shift;
	my $x = shift;
	my $y = shift;

	for (my $a = 0; $a < 9; $a++) {
		print ">> $self->{reg2}[$a][0] -- $self->{reg2}[$a][1]\n";
	}

	
}
sub retHash{
	my $self = shift;
	my $val = shift;
	print "$val \n";
	given($val){
		when("0x1" )
		{ 	print "entrei! \n";
			return 1;
		}

	}
}
1;