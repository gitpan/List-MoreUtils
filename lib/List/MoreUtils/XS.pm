package List::MoreUtils::XS;

use 5.008001;
use strict;
use warnings;

use vars qw{$VERSION @ISA};

BEGIN
{
    $VERSION  = '0.400_002';

    # Load the XS at compile-time so that redefinition warnings will be
    # thrown correctly if the XS versions of part or indexes loaded
    my $ldr = <<EOLDR;
	package List::MoreUtils;

	# PERL_DL_NONLAZY must be false, or any errors in loading will just
	# cause the perl code to be tested
	local \$ENV{PERL_DL_NONLAZY} = 0 if \$ENV{PERL_DL_NONLAZY};

	use XSLoader ();
	XSLoader::load("List::MoreUtils", "$VERSION");

	1;
EOLDR

    eval $ldr unless $ENV{LIST_MOREUTILS_PP};
    $@ and die $@;
}

=pod

=head1 NAME

List::MoreUtils::XS - Provide compiled List::MoreUtils functions

=head1 SYNOPSIS

  BEGIN { delete $ENV{LIST_MOREUTILS_PP}; }
  use List::MoreUtils;

=head1 SEE ALSO

L<List::Util>

=head1 AUTHOR

Jens Rehsack E<lt>rehsack AT cpan.orgE<gt>

Adam Kennedy E<lt>adamk@cpan.orgE<gt>

Tassilo von Parseval E<lt>tassilo.von.parseval@rwth-aachen.deE<gt>

=head1 COPYRIGHT AND LICENSE

Some parts copyright 2011 Aaron Crane.

Copyright 2004 - 2010 by Tassilo von Parseval
Copyright 2013 by Jens Rehsack

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.8.4 or,
at your option, any later version of Perl 5 you may have available.

=cut

1;
