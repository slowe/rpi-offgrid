#!/usr/bin/perl

use POSIX qw(strftime);
use Cwd qw(abs_path);

my $basedir = "./";
if(abs_path($0) =~ /^(.*\/)[^\/]*/){ $basedir = $1; }

$log = $ARGV[0];

$script = $basedir."getBattery.py";
@lines = `python3 $script`;

$battery = -1;
if($lines[0] =~ /'data': ([0-9]+)/){
	$battery = $1;
}

print $battery."%\n";
print $log."\n";
if($log){
	open(LOG,">>",$log);
	print LOG strftime("%FT%R%z",localtime())."\tBattery = $battery\%\n";
	close(LOG);
}
