#! /usr/bin/env perl

# <!-- Copyright (C) The IETF Trust (2014) -->
# <!-- Copyright (C) The Internet Society (2014) -->

use strict;
use Carp;

my $last;
my $firstLine = 1;
my $processFirst = 1;

# Do not print a blank first or last line!
while (<>) {
    if ($firstLine) {
        $firstLine = 0;
    } else {
        if ($processFirst) {
            if ($last ne "\n") {
                print $last;
            }

            $processFirst = 0;
        } else {
            print $last;
        }
    }

    $last = $_;
}

if (!$firstLine) {
    if ($last ne "\n") {
        print $last;
    }
}
