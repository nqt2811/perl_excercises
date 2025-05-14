#!/usr/bin/perl

use strict;
use warnings;
use feature 'say';
use Scalar::Util qw(looks_like_number);

if (@ARGV != 3) {
    say "Wrong format. Please use: ex4.pl operator num1 num2";
    exit 1;
}

my ($method, $number1, $number2) = @ARGV;
my @valid_methods = ("add", "sub", "mul", "div", "exp", "mod");

unless (grep { $_ eq $method } @valid_methods) {
    say "Please use one of supported operator: add|sub|mul|div|exp|mod";
    exit 1;
}

unless (looks_like_number($number1) && looks_like_number($number2)) {
    say "Please use number for element of operator";
    exit 1;
}

if ($method eq "add") {
    say "Result: " . ($number1 + $number2);
}
elsif ($method eq "sub") {
    say "Result: " . ($number1 - $number2);
}
elsif ($method eq "mul") {
    say "Result: " . ($number1 * $number2);
}
elsif ($method eq "div") {
    if ($number2 == 0) {
        say "Can not div|mod by zero";
    } else {
        say "Result: " . ($number1 / $number2);
    }
}
elsif ($method eq "exp") {
    say "Result: " . ($number1 ** $number2);
}
elsif ($method eq "mod") {
    if ($number2 == 0) {
        say "Can not div|mod by zero";
    } else {
        say "Result: " . ($number1 % $number2);
    }
}

exit 0;
