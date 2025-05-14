#!/usr/bin/perl

use strict;
use warnings;

open(my $fh1, "<", "/mnt/net/vault100t/asic/uniquify/training/VNLD_2024/LD_training.242/users/tienn/perl_lab/data/ex5/run_pnr.csh") or die "Cant open file 'run_pnr.csh' $!";
open(my $fh2, ">", "run_pnr.mod.csh") or die "Cant write file 'run_pnr.mod.csh' $!";

my @mem = ("10G (FLOORPLAN)", "11G (PLACE)", "12G (CTS_CCD)", "13G (CTS_RT)", "14G (ROUTE)", "15G (ROUTE_OPT)", "16G (CHIP_FINISH)", "17G (METAL_FILL)", "18G (EXPORT)");
my $index = 0;

while (my $line = <$fh1>) {
    	$line =~ s/\$\{PERSEUS_HOME}\/src\/perl\/script\/psub\.pl/qsub/g;

    	$line =~ s/\Qdragonx\E/test/g;

    	$line =~ s/\Qmodule load synopsys\/synopsys\E/source \/tools\/.cshrc.tools.train/g;

    	$line =~ s/\\"//g;

	$line =~ s/20G/$mem[$index++]/g;

    	print $fh2 $line;
}

close($fh1);
close($fh2);
