package Sah::Schema::num_seq;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [str => {
    summary => 'Number sequence, e.g. 1,3,5,...,16',
    match => qr/\A
                (?:[+-]?[0-9]+(?:\.[0-9]+)?)
                (?:
                    \s*,\s*
                    (?:[+-]?[0-9]+(?:\.[0-9]+)?)
                )*
                (?:
                    \s*,\s*
                    \.\.\.
                )?
                (?:
                    \s*,\s*
                    (?:
                        (?:[+-]?[0-9]+(?:\.[0-9]+)?) | [+-]?Inf
                    )
                )?
                \z/x,
    prefilters => ['NumSeq::check_num_seq'],
    examples => [
        {data=>'', valid=>0, summary=>'Empty string'},
        {data=>'1,2,', valid=>0, summary=>'invalid syntax'},

        {data=>'1,2,3', valid=>1},
        {data=>'1,2,3,...', valid=>1},
        {data=>'1,2,3,...,10', valid=>1},
        {data=>'1,2,3,...,Inf', valid=>1},
        # more tests in NumSeq::Iter
    ],
}, {}];

1;
# ABSTRACT:

=head1 SEE ALSO

L<NumSeq::Iter>
