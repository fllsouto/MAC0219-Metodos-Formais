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
	# print "\n---------------\n";
	# foreach my $a (@$predicates){ print "$a << \n";}
	# print "\n---------------\n";
	my $newCell = [$predicates,$restritors];
	push ($self->{setOfClauses},$newCell);	
}

sub addVariables{
	my $self = shift;
	my $key = shift;
	my $range = shift;
	$self->{variables}->{$key} = $range;
}

sub returnRange{
	my $self = shift;
	my $key = shift;
	my $range = $self->{variables}->{$key};
	return $range;
}

sub writeClauses{
	my $self = shift;
	for (my $x = 0; $x < $self->clausesListSize(); $x++) {
		my $clausuresList = $self->takeClausureList($x);
		my $predicate = takePredicateList($clausuresList);
		my $restritor = takeRestritorList($clausuresList);

		if ($restritor->[0] eq "null"){
			# $self->printingPredicatesNotLimited($predicate);
			$self->writingPredicatesNotLimited($predicate);
		}
		else{
		}
	}
}
sub getZeroVector{
	my $size = shift;
	my @vector;
	for (my $x = 0; $x < $size; $x++) {
		$vector[$x] = 0;
	}
	return @vector;
}
sub writingPredicatesNotLimited{
	my $self = shift;
	my $predicate = shift;
	my @variablesList = (returnVariablesList($predicate));
	$, = " ;;;; ";
	$" = " ::: ";
	# print ">"x30 ."\n";
	# print "XX#List : @variablesList   <<! \n\n";
	# print "<"x30 ."\n";

	foreach my $x (@variablesList) {
		print ">< $x \n";
	}
	print "\n\n";

	my @out = map { $self->getMinimumRange($_) } @variablesList;
	foreach my $x (@out) {
		print ">>> $x \n";
	}
	print "\n\n";
}

sub getMinimumRange{
	my $self = shift;
	my $key = shift;
	print "Key : $key\n";
	my @chaves = keys $self->{variables};
	print "Chaves : @chaves   \n";
	print "FOO : $self->{variables}\n";
	return 0;
}

sub returnVariablesList{
	my $predicate = shift;
	my $str = "";
	my %hash;
	for (my $x = 0; $x < listSize($predicate); $x++) {
		$str = $str . " " . $predicate->[$x];
	}
	# print "#STR : $str \n";
	while ($str =~ /([A-Z]+)/g){
		$hash{$1} = 1;
	}
	my @variables = $str =~ /([A-Z]+)/g;
	my @keyList = keys %hash;
	return @keyList;
}

sub printingPredicatesNotLimited{
	my $self = shift;
	my $predicate = shift;
	print ">"x30 ."\n";
	for (my $x = 0; $x < listSize($predicate); $x++) {
		print "#$x -- $predicate->[$x] \n";
	}
	print "<"x30 ."\n";
}

sub printClausesList{
	my $self = shift;
	for(my $x = 0; $x < $self->clausesListSize; $x++){
		my $clausuresList =  $self->takeClausureList($x);
		print "--------------------- \n";
		my $predicate = takePredicateList($clausuresList);
		for (my $y = 0; $y < listSize($predicate); $y++){
			print "$y - Predicado : $predicate->[$y]\n";
		}
		print "<=================================================> \n";
		my $restritor = takeRestritorList($clausuresList);
		for (my $y = 0; $y < listSize($restritor); $y++){
			print "$y - Restritor : $restritor->[$y]\n";
		}
		print "--------------------- \n";
	}
}	

sub takeClausureList{
	my $self = shift;
	my $index = shift;
	return $self->{setOfClauses}->[$index];
}

sub takePredicateList{
	my $list = shift;
	return $list->[0];
}

sub takeRestritorList{
	my $list = shift;
	return $list->[1];
}

sub printVariablesList{
	my $self = shift;
	my $hash = $self->{variables};
	my @keyList = keys $self->{variables};
	foreach my $a (@keyList){
			my $range = $self->takeTheRange($a);
			print "key : $a  \n";
			print "[$range->[0], $range->[1]] \n"
		}
	
}

sub takeTheRange{
	my $self = shift;
	my $key = shift;
	return $self->{variables}->{$key};
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