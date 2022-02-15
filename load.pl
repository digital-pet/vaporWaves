#!/usr/bin/perl -w

## vaporWaves
## Copyright (C) 2010-2022  digital-pet
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU Affero General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU Affero General Public License for more details.
##
## You should have received a copy of the GNU Affero General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

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
