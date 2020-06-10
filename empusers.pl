#!/usr/bin/perl
#
# empusers.pl - Disdlay a list of user accounts still in sanctuary
#               Outputs to stdout.

my $UserOutputCmd = "echo country \\* |/usr/local/bin/empire POGO peter";
my @InputLines = ();
my $CountryList = "";

@InputLines = `$UserOutputCmd`;

foreach (@InputLines)
{
	my $row = $_;

	#print "$row\n";
	chomp $row;
	if (index($row, "Sanctuary") > 0)
	{
		my $ActualCountry = substr($row, 1);
		#print "$ActualCountry\n";
		my $countrynum = substr($row, 1, 3);
		$countrynum =~ s/^\s+|\s+$//g;
		# print "$countrynum\n";
		if ($CountryList eq "")
		{
			$CountryList = $countrynum;
		}
		else
		{
			$CountryList = "$CountryList, $countrynum";
		}
	}
}
print "Below are the countries still available to be claimed:\n";
print "$CountryList\n\n";
print "The password for each country is the same as the country number. Once you move out of your sanctuary you will \"own\" that country and can change the country name & password...\n";
exit 0;
