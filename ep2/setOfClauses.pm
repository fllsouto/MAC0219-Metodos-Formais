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
	my @list = shift;
	my @restritors = shift;
	my $newCell = [@list,@restritors];
	push ($self->{setOfClauses},$newCell);	
}

sub printPredicateList{
	my $self = shift;
	for(my $x = 0; $x < $self->clausesListSize; $x++){
		foreach $a ($self->{setOfClauses}[$x]){
			print "Lista : $a";
		}
	}
}

sub clausesListSize{
	$self = shift;
	return length($self->{setOfClauses});
}