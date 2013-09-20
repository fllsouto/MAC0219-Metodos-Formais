#!/usr/bin/perl

use v5.10;
use strict;
use warnings;

package nxnArray;

sub new{
    my $class = shift;
    my $self = {
	sudoku => [],
	input => [],
	centros => [[1,1],[1,4],[1,7],[4,1],[4,4],[4,7],[7,1],[7,4],[7,7]]
    };

    bless $self, $class;
    #print "Ins OK! \n";
    return $self;
}



#imprime a matrix criada
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
#constroi o sudoku
sub readInput{
    my $self = shift;
    #Facepalm!
    my @string = @_;
    $self->{input} = \@string;
    my $a = undef;
    my $i = 0;
    my $j = 0;

    use integer;
    for($a = 0; $a < 81; $a++,$j++){
	if($j == 9){
	    $j = 0;
	    $i++;
	}
	$self->{sudoku}[$i][$j] = $string[$a];
	#print "#$a($i , $j) $string[$a] X $self->{0}[$i][$j]\n";
    }

#	for($a = 0; $a < 81; $a++,$j++){
#		if (( my $ndx = $self->{input}[$a]) != 0){
#			my $value = tipReturn($a, $ndx);
#			print "$self->{input}[$a] -- ($ndx - $value) \n";
#		}
#	}
}
#dado um a e um indx retorna sua equivalencia


sub tipReturn {
    my $a = shift;
    my $indx = shift;

    return 9*$a +$indx;
}

sub subSquare {
    my $self = shift;
    use integer;

    for (my $z = 0; $z < 9; $z++) {
	
	for(my $c = 0; $c < 9; $c++){
	    my $l = $self->{centros}->[$c]->[0];
	    my $k = $self->{centros}->[$c]->[1];

	    for(my $p = -1; $p <= 1; $p++){
		for(my $q = -1; $q <= 1; $q++){
		    #my $fixo = $self->{sudoku}[$l+$p][$k+$q];
		    my $fixo = 9*($l+$p) + 81*($k+$q) + $z;
		    for(my $m = -1; $m <= 1; $m++){
			for(my $n = -1; $n <= 1; $n++){		
			    #my $comb = $self->{sudoku}[$l+$m][$k+$n];
			    my $comb = 9*($l+$m) + 81*($k+$n) +$z;
			    if( ($m > $p) || ($m == $p && $n > $q) ){
				print "-".($fixo+1)." -".($comb+1)." 0\n";
				#print "".($fixo+1)." ".($comb+1)." 0\n";
			    }
			}	
		    }	
		    
		}

	    }
	}

    }
}

sub highlanderLine {
    my $self = shift;
    for (my $z = 0; $z < 9; $z++) {
	for (my $i = 0; $i < 9; $i++) {
	    for (my $j = 0; $j < 9; $j++) {
		my $fixo = 9*($j) + 81*($i) + $z; 
		for (my $k = $j +1; $k < 9; $k++) {
		    my $comb = 9*($k) + 81*($i) +$z;
		    print "-".($fixo+1)." -".($comb+1)." 0\n";
		    #print "".($fixo+1)." ".($comb+1)." 0\n";
		}
	    }
	}
    }
    
}

sub highlanderColumn {
    my $self = shift;
    for (my $z = 0; $z < 9; $z++) {
	for (my $j = 0; $j < 9; $j++) {
	    for (my $i = 0; $i < 9; $i++) {
		my $fixo = 9*($j) + 81*($i) + $z; 
		for (my $k = $i +1; $k < 9; $k++) {
		    my $comb = 9*($j) + 81*($k) +$z;
		    print "-".($fixo+1)." -".($comb+1)." 0\n";
		    #print "".($fixo+1)." ".($comb+1)." 0\n";
		}
	    }
	}
    }
    
}
####################################################################################
####################################################################################
####################################################################################
#nao e mais necessario
# sub createMatrix{
# 	my $self = shift;
# 	my $indx = shift;
# 	my $i = 0;
# 	my $j = 0;
# 	my $a = 0;
# 	for(; $a < 81; $a++,$j++){
# 		if($j == 9){
# 			$j = 0;
# 			$i++;
# 		}
# 	    $self->{$indx}[$i][$j] = $indx;
# 	}
# }

#Dado um i,j e um valor F, este e descartado
# sub discartPos{
# 	my $self = shift;
# 	my $i = shift;
# 	my $j = shift;
# 	my $mtxNumber = shift;


# 	#print "Index escolhido : $index \n";
# 	$self->{$mtxNumber}[$i][$j] = "X";
# }
# #remove as coordenadas das dicas
# sub pointRmv {
# 	my $self = shift;
# 	my $index = undef;
# 	for (my $i = 0; $i < 9; $i++) {
# 		for (my $j = 0; $j < 9; $j++) {
# 			if (($index = $self->{0}[$i][$j]) != 0) {
# 				for (my $k = 1; $k <= 9; $k++) {
# 					if ($index != $self->{$k}[$i][$j]) {
# 						discartPos($self,$i,$j,$k);
# 					}
# 				}
# 			}
# 		}
# 	}
# }
# #Remocao horizontal, aka coluna
# sub horizontalRmv{
# 	my $self = shift;
# 	my $index = undef;
# 	for (my $i = 0; $i < 9; $i++) {
# 		for (my $j = 0; $j < 9; $j++) {
# 			if (($index = $self->{0}[$i][$j]) != 0) {
# 				for (my $k = 0; $k < 9; $k++) {
# 					if ($k != $j) {
# 						discartPos($self,$i,$k,$index);
# 					}
# 				}
# 			}
# 		}
# 	}

# }

# sub verticalRmv{
# 	my $self = shift;
# 	my $index = undef;
# 	for (my $i = 0; $i < 9; $i++) {
# 		for (my $j = 0; $j < 9; $j++) {
# 			if (($index = $self->{0}[$i][$j]) != 0) {
# 				for (my $k = 0; $k < 9; $k++) {
# 					if ($k != $i) {
# 						discartPos($self,$k,$j,$index);
# 					}
# 				}
# 			}
# 		}
# 	}

# }

# sub zoneRmv{
# 	my $self = shift;
# 	my $x = shift;
# 	my $y = shift;

# 	for (my $a = 0; $a < 9; $a++) {
# 		print ">> $self->{reg2}[$a][0] -- $self->{reg2}[$a][1]\n";
# 	}


# }
# sub retHash{
# 	my $self = shift;
# 	my $val = shift;
# 	print "$val \n";
# 	given($val){
# 		when("0x1" )
# 		{ 	print "entrei! \n";
# 			return 1;
# 		}

# 	}
# }
1;
