#!/usr/bin/perl
# script to modify FASTQ header lines for Trinity program
# Hidemasa Bono <bonohu@gmail.com>

my $c = 0; # line count value
my $strand = shift(@ARGV); # 1 or 2

print STDERR "usage: % perl for_trinity.pl 1 (or 2) < SRA.fastq > processed.fastq\n" if ($strand eq '') ;

# STDIN: FASTQ file
while(<STDIN>) {
	chomp;
	if( $c++ % 4 != 0) {
		print "$_\n";
	} else {
		if(/^\@[SDE]RR\S+\s+(\S+)/) {
			$id = $1;
			print "\@$id/$strand\n";
  		} else {
			print STDERR "invalid FASTQ format in line $c\n";
			exit 1;
		}
	}
}
