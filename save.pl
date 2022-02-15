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

open(STDERR, ">&STDOUT");

use Getopt::Std;
use File::Basename;

use lib dirname($0);

my %opts;
getopts('h:p:P:g:l:n:u:U:', \%opts);

$host = $opts{'h'};

$port = $opts{'p'};

$pass = $opts{'P'};

$genre = $opts{'g'};

$uri = $opts{'l'};

$name = $opts{'n'};

$update_enabled = $opts{'u'};

$update_path = $opts{'U'};

$file = $ARGV[0];

use Config::Simple;
$cfg = new Config::Simple(syntax=>'ini');

$cfg->param("connect.host", $host);
$cfg->param("connect.port", $port);
$cfg->param("connect.pass", $pass);

$cfg->param("stream.genre", $genre);
$cfg->param("stream.url", $uri);
$cfg->param("stream.name", $name);

$cfg->param("autoupdate.enabled", $update_enabled);
$cfg->param("autoupdate.path", $update_path);

$cfg->write($file);
