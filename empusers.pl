#!/usr/bin/perl
#
# empusers.pl - Disdlay a list of user accounts still in sanctuary
#               Outputs to stdout.

my $UserOutputCmd = "echo sanc | nc synchronetbbs.org 6665";
my @CountryNumbers = ();
my @InputLines = ();

@InputLines = `$UserOutputCmd`;

foreach (@InputLines)
{
	my $row = $_;

	chomp $row;
	if (substr($row, 0, 1) eq "1")
	{
		my $ActualCountry = substr($row, 2);
#		print "$ActualCountry\n";
		push (@CountryNumbers, $ActualCountry);
	}
}
print "@CountryNumbers\n\n";
print "The password for each country is the same as the country number. Once you move out of your sanctuary you will \"own\" that country and can change the country name & password...\n";
exit 0;
