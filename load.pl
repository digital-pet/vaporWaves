#!/usr/bin/perl -w

use Getopt::Std;
use File::Basename;

use lib dirname($0);

my %opts;
getopts('hpPglnuU', \%opts);

use Config::Simple;
$cfg = new Config::Simple($ARGV[0]);

if ($opts{'h'}) {
print $cfg->param("connect.host");
} elsif ($opts{'p'}) {
print $cfg->param("connect.port");
} elsif ($opts{'P'}) {
print $cfg->param("connect.pass");
} elsif ($opts{'g'}) {
print $cfg->param("stream.genre");
} elsif ($opts{'l'}) {
print $cfg->param("stream.url");
} elsif ($opts{'n'}) {
print $cfg->param("stream.name");
} elsif ($opts{'u'}) {
print $cfg->param("autoupdate.enabled");
} elsif ($opts{'U'}) {
print $cfg->param("autoupdate.path");
} else {
exit();
}