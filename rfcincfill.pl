#! /usr/bin/env perl

# <!-- Copyright (C) The IETF Trust (2014) -->
# <!-- Copyright (C) The Internet Society (2014) -->

use strict;
use Carp;

open(my $xml_fh, '<', "$ARGV[0]") or croak "Could not open for read $ARGV[0]";

my @lines = <$xml_fh>;
close $xml_fh;

open(my $ag_fh, '>', "$ARGV[1]") or croak "Could not open for write $ARGV[1]";

foreach my $line (@lines) {
    if ($line =~ /<\?rfc include=\'(.*)\'\?>/) {
        open(my $extra_fh, '<', "$1") or croak "Could not open for read $1";
        while (<$extra_fh>) {
            print $ag_fh $_;
        }
    } else {
        print $ag_fh $line;
    }
}

close $ag_fh;
