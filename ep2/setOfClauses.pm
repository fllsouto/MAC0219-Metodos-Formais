#!/usr/bin/perl

use v5.10;
use strict;
use warnings;

package setOfClauses;

sub new{
	my $class = shift;
	my $self = {
		variables => {},
		setOfClauses => []
	};
	bless $self, $class;
	return $self;
}

sub addPredicateList{
	my $self = shift;
	my $predicates = shift;
	my $restritors = shift;
	print "\n---------------\n";
	# foreach my $a (@$predicates){ print "$a << \n";}
	print "\n---------------\n";
	my $newCell = [$predicates,$restritors];
	push ($self->{setOfClauses},$newCell);	
}

sub printPredicateList{
	my $self = shift;
	my $x = $self->clausesListSize();
	my $k = $self->predicatesQuantites(5);
	print "Qnt linhas : $k\n";
	# for(my $x = 0; $x < $self->clausesListSize; $x++){
	# 	foreach $a ($self->{setOfClauses}->[$x]){
	# 		print "#$x - Lista : $a";
	# 	}
	# }
}
sub predicatesQuantites{
	my $self = shift;
	my $index = shift;
	my $quantitie;
	if (exists $self->{setOfClauses}->[$index]){
		$quantitie = listSize($self->{setOfClauses}->[$index]->[0]);
	}
	else{
		return 0;
	}
	return $quantitie;
}

sub clausesListSize{
	my $self = shift;
	my $s = $self->{setOfClauses};
	$s = @$s;
	return $s;
}

sub listSize{
	my $list = shift;
	$list = @$list;
	return $list
}
1;

# foreach my $a (@$predicates){ print "$a << \n";}
#forma correta de iterar ao longo da lista