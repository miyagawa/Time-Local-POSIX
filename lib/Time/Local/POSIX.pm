package Time::Local::POSIX;

use strict;
use warnings;
use 5.008_005;
our $VERSION = '0.01';

use Time::Local 1.27 ();

use parent 'Exporter';
our @EXPORT = qw( timelocal timegm );

sub timelocal {
    Time::Local::timelocal_modern(@_[0..4], $_[5] + 1900);
}

sub timegm {
    Time::Local::timegm_modern(@_[0..4], $_[5] + 1900);
}

1;
__END__

=encoding utf-8

=head1 NAME

Time::Local::POSIX - Time::Local that handles year as an offset from 1900

=head1 SYNOPSIS

  use Time::Local::POSIX;

  # $year must be the offset from 1900
  my $time = timelocal( $sec, $min, $hour, $mday, $mon, $year );
  my $time = timegm( $sec, $min, $hour, $mday, $mon, $year );

=head1 DESCRIPTION

Time::Local::POSIX is a drop-in replacement for L<Time::Local> that doesn't
perform any year value interpretation, and still guarantees round-trip safety
for C<localtime> and C<gmtime> functions.

L<Time::Local> offers C<time*_modern> functions but they expect years in 4-digit
numbers, which means you can't safely roundtrip return values from C<localtime>
and C<gmtime> built-in functions.

In fact this module just provides a wrapper around L<Time::Local>'s
C<time*_modern> functions.

=head1 AUTHOR

Tatsuhiko Miyagawa E<lt>miyagawa@bulknews.netE<gt>

=head1 COPYRIGHT

Copyright 2020- Tatsuhiko Miyagawa

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Time::Local>

=cut
