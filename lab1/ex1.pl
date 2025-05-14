#!/usr/bin/perl
use strict;
use warnings;
use feature 'say';

open(my $input, "<", "input.txt") or die "Cannot open file input.txt: $!";
my %info;

while (my $line = <$input>) {
    if ($line =~ /-\s*(\w+)\s*:\s*(\d+)/) {
        my $name = $1;
        my $year = $2;
        $info{$name} = $year;
    }
}
close $input;

for (my $i = 2015; $i <= 2035; $i += 2) {
    my $age = $i - $info{'Tom'};
    say "Tom's age in $i: $age";
}

say "";

foreach my $name (keys %info) {
    if ($name ne "Tom") {
        if ($info{"Tom"} > $info{$name}) {
            say "$name is older than Tom";
        }
        elsif ($info{"Tom"} == $info{$name}) {
            say "$name is as young as Tom";
        }
        else {
            say "$name is younger than Tom";
        }
    }
}
