# NAME

Time::Local::POSIX - Time::Local that handles year as an offset from 1900

# SYNOPSIS

    use Time::Local::POSIX;

    # $year must be the offset from 1900
    my $time = timelocal( $sec, $min, $hour, $mday, $mon, $year );
    my $time = timegm( $sec, $min, $hour, $mday, $mon, $year );

# DESCRIPTION

Time::Local::POSIX is a drop-in replacement for [Time::Local](https://metacpan.org/pod/Time::Local) that doesn't
perform any year value interpretation, and still guarantees round-trip safety
for `localtime` and `gmtime` functions.

[Time::Local](https://metacpan.org/pod/Time::Local) offers `time*_modern` functions but they expect years in 4-digit
numbers, which means you can't safely roundtrip return values from `localtime`
and `gmtime` built-in functions.

In fact this module just provides a wrapper around [Time::Local](https://metacpan.org/pod/Time::Local)'s
`time*_modern` functions.

# AUTHOR

Tatsuhiko Miyagawa <miyagawa@bulknews.net>

# COPYRIGHT

Copyright 2020- Tatsuhiko Miyagawa

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO

[Time::Local](https://metacpan.org/pod/Time::Local)
