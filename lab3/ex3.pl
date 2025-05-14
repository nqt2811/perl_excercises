#!/usr/bin/perl

use strict;
use warnings;

my $report_path = "/mnt/net/vault100t/asic/uniquify/training/VNLD_2024/LD_training.242/users/tienn/perl_lab/data/ex3/report.rpt";
open(my $fh, "<", $report_path) or die "Cant open file 'report.rpt' $!";

printf "Link of input report: $report_path\n\n";

my %timing_paths;
my $current_startpoint;
my $current_endpoint;
my $current_slack;

while (my $line = <$fh>) {
    chomp $line;
    if ($line =~ /^\s*Startpoint:\s+(?:\S+\/)?([^\/\s]+)\s*(?:\(.*\))?$/) {
        $current_startpoint = $1;
        next;
    }

    if ($line =~ /^\s*Endpoint:\s+(.+?)(?:\/([^\/]+))?\s*$/) {
        $current_endpoint = $2 // $1;
        next;
    }

    if ($line =~ /^\s*slack \(MET\)\s+(\S+)/) {
        $current_slack = $1;
        push @{$timing_paths{$current_startpoint}}, {
            endpoint => $current_endpoint,
            slack => $current_slack
        };
        $current_startpoint = undef;
        $current_endpoint = undef;
        next;
    }
    if ($line =~ /^\s*$/) {
        next;
    }
}

close($fh);

print "------------------------------------------------------------------------------------\n";
    printf "%-35s%-40s%-10s\n", "Startpoint", "Endpoint", "Slack";
    print "------------------------------------------------------------------------------------\n";

foreach my $startpoint (sort keys %timing_paths) {
    my $first_line = 1;
    foreach my $path (@{$timing_paths{$startpoint}}) {
        if ($first_line) {
            printf "%-35s%-40s%-10s\n", $startpoint, $path->{endpoint}, $path->{slack};
            $first_line = 0;
        } else {
            printf "%-35s%-40s%-10s\n", "", $path->{endpoint}, $path->{slack};
        }
    }
    print "------------------------------------------------------------------------------------\n";
}
