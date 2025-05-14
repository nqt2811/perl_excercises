#!/usr/bin/perl

use strict;
use warnings;
use File::Path qw(make_path);

my $input_pattern  = "/mnt/net/vault100t/asic/uniquify/training/VNLD_2024/LD_training.242/users/tienn/perl_lab/lab6/outfiles/psim3tx*/psim3tx*.mt0";

my @input_files = glob $input_pattern;

my $output_reformatted_directory = "extract_files/mt0_reformatted_files";
my $output_csvfile_directory = "extract_files/csv_files";

#Create directories if do not have
unless (-e $output_reformatted_directory and -d _) {
    make_path($output_reformatted_directory) or die "Cannot create directory $output_reformatted_directory: $!";
}
unless (-e $output_csvfile_directory and -d _) {
    make_path($output_csvfile_directory) or die "Cannot create directory $output_csvfile_directory: $!";
}

#All params need for *.csv files
my @params = ("permutation", "mode", "param_modelfile", "param_rmodellib", "param_cmodellib", "param_bjtmodellib", "param_mciterations", 
                "param_typ", "param_cmax", "param_cmin", "param_vddio", "param_vdd", "param_temp", "param_datarate", "padp_dutycycle", 
                "padn_dutycycle", "padp_padn_dutycycle", "padn_padp_dutycycle", "padp_risetime", "padp_falltime", "padn_risetime", "padn_falltime");

foreach my $element (@input_files) {
    open(my $fh1, "<", "$element") or die "Cannot open file $!";

    my $found_alter = 0;
    my $skip_lines = 2;
    my $reformatted_filename;
    my @vars;
    my @values;

    my %hash;

    if ($element =~ /\/(\w+)\.mt0$/) {
        $reformatted_filename = $1;

        open(my $fh2, ">", "$output_reformatted_directory/$reformatted_filename.mto_reformatted") or die "Cannot write file $!";
        
        #Collect variables and values from files *.mt0
        while (my $line = <$fh1>) {

            chomp($line);
            
            #Skip two lines do not have any variables
            if ($skip_lines > 0) {
                $skip_lines--;
                next;
            }

            #Use last variable "alter" as a checkpoint
            if ($line =~ /alter/) {
                $found_alter = 1;
                next;
            }

            if ($found_alter) {
                while ($line =~ /(\S+)/g) {
                    push(@values, $1);
                }
            } else {
                while ($line =~ /(\S+)/g) {
                    push(@vars, $1);
                }
            }
        }

        #Add "alter" because I use it as checkpoint
        push(@vars, "alter");
        
        #Set up values for *.csv file - permutation and mode
        for (my $i = 0; $i < scalar @vars; $i++) {
            $hash{$vars[$i]} = $values[$i];
            print $fh2 "$vars[$i] = $values[$i]\n";
        }

        if ($element =~ /\/(psim3tx\S*)\//) {
            $hash{"permutation"} = $1;
        }

        foreach my $key (keys %hash) {
            if ($key =~ /^param_ddr|^param_lpddr/) {
                if ($hash{$key} == 1 && $key =~ /_(\w*)/) {
                    $hash{"mode"} = $1;
                }
            }
        }
        
        #Write to *.csv files manually
        open(my $fh3, ">", "$output_csvfile_directory/$reformatted_filename\_collect_data.csv") or die "Cannot write file $!";

        print $fh3 join(",", @params) . "\n";
        print $fh3 join(",", map { $hash{$_} } @params) . "\n";

        close($fh2);
        close($fh3);
    }

    close($fh1);
}
