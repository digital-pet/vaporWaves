#!/usr/bin/perl -w

use Getopt::Std;

my %opts;
getopts('h:p:P:f:x', \%opts);

$host = $opts{'h'};

$port = $opts{'p'};

$pass = $opts{'P'};

$file = $opts{'f'};

$tempfile = "/tmp/vwave_songname";

if ($opts{'x'}) {
	unlink $tempfile or warn "can't unlink $tempfile: $!\n";
	exit();
}

open(my $fh, '<', $file) or die "can't open $file for read: $!\n";
	$songname = <$fh>;
close($fh);

if (-e $tempfile) {
	open (my $tmp, "<", $tempfile) or warn "can't open $tempfile for read: $!\n";
	$oldname = <$tmp>;
	close($tmp);
} else {
	$oldname = "";
}

unless ($oldname eq $songname) {

	require URI::Escape;
	import URI::Escape;

	require LWP::UserAgent;

	open (my $tmp, ">", $tempfile) or warn "can't open $tempfile for write: $!\n";
	print $tmp $songname;
	close($tmp);

	$request_uri = "http://" . uri_escape($host) . ":" . uri_escape($port) . "/admin.cgi?pass=" . uri_escape($pass) . "&mode=updinfo&song=" . uri_escape($songname, "^A-Za-z0-9");

	$ua = LWP::UserAgent->new;
	$ua->agent('Mozilla/5.0 (compatible; vaporWaves streaming platform) ' .  $ua->agent);

	$ua->get($request_uri);
}
