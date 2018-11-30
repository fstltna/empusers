#!/usr/bin/perl
#
# empusers.pl - Disdlay a list of user accounts still in sanctuary
#               Outputs to stdout.

my $UserOutputCmd = "echo sanc | nc -N synchronetbbs.org 6665";
my $TestFile = "empoutput.txt";
my @CountryNumbers = ();

open(my $INP, '<', $TestFile)
	or die "Could not open $TestFile $!";

while (my $row = <$INP>)
{
	chomp $row;
	if (substr($row, 0, 1) eq "1")
	{
		my $ActualCountry = substr($row, 2);
#		print "$ActualCountry\n";
		push (@CountryNumbers, $ActualCountry);
	}
}
print "@CountryNumbers\n";
print "The password for each country is the same as the country number. Once you move out of your sanctuary you will \"own\" that country and can change the country name & password...\n";
exit 0;
