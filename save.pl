#!/usr/bin/perl -w

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