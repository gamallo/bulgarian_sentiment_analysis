#!/usr/bin/perl -w
binmode STDIN, ':utf8';
binmode STDOUT, ':utf8';
binmode STDERR, ':utf8';
use utf8;
use open qw(:std :utf8);


$file = shift(@ARGV);
open (LEX, $file) or die "O ficheiro do lexico de polaridade $!\n";
binmode LEX,  ':utf8';


while (my $line = <LEX> ) {
    chomp $line;
    my ($lemma, $pol) = split ('\t', $line);
    $LEX{$lemma} = $pol;
}

$pos=0;
$neg=0;
#$sent="";
while (my $line = <STDIN> ) {
  
    chomp $line;
    my ($token, $tag, $lemma) = split ('\t', $line);
  #  print STDERR "$token -- $tag -- $lemma\n";
    if ($lemma eq "<unknown>") {
	$lemma = $token;
    }
    
     if ($lemma && $LEX{$lemma} && $LEX{$lemma} =~ /^POS/) {
	$pos++;
	print STDERR "pos: $lemma\n";
#	print "pos:$lemma|";
    }  
    elsif ($lemma && $LEX{$lemma} && $LEX{$lemma} =~ /^NEG/) {
	$neg++;
	print STDERR "neg: $lemma\n";
	#print "neg:$lemma|";
    }
    #$n++

}

print STDERR "pos=#$pos# - neg#$neg#\n";
if ($pos > $neg) {
    print "pos";
}
elsif ($neg > $pos) {
    print "neg";
}
elsif ($neg == $pos || (!$neg && !$pos)) {
    print "neu"
}





