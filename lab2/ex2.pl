#!/usr/bin/perl

@array_a = (a..z);
$array_a_size = @array_a;

print "array_a: @array_a\n";
print "Number of elements: $array_a_size\n\n";

my @array_b = ();
$b_element = 0;
for ($i = 0; $i < $array_a_size; $i++) {
	push(@array_b, $b_element);
	$b_element += 2;
}

print "array_b: @array_b\n\n";


for ($j = 0; $j < 20; $j++) {
	pop(@array_a);
	pop(@array_b);
}

print "array_a and array_b after removing 20 elements\n";
print "array_a: @array_a\n";
print "array_b: @array_b\n\n";

use Cwd qw(cwd);
$full_dir = cwd;
 
print "Current directory: $full_dir\n";

@dirs = split('/', $full_dir);
$last_dir = $dirs[-1];

mkdir("$last_dir\_tienn");
mkdir("$last_dir\_tienn/$last_dir");
