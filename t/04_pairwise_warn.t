
use strict;
use warnings;
use Test::More;

# Test that pairwise doesn't cause Perl to generate "used only once" warnings
# for $a and $b in the caller's package.

# This test cannot be a part of the 02_perl.t and 03_xs.t runtimes, because the
# warnings we're testing for are only generated if $a and $b are seen no more
# than once.  Those other tests would clobber the warning.

if( ! eval 'use Test::NoWarnings; 1;' ) {
    plan skip_all => 'Test::NoWarnings required for pairwise warning test.';
}
else {
    plan tests => 1;
}

use List::MoreUtils qw( pairwise );

my @left = qw( one two three );
my @right = ( 1, 2, 3, );

my @res = pairwise { "$a => $b" } @left, @right;

# Test::NoWarnings::had_no_warnings() test runs implicitly.
