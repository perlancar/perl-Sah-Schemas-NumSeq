package Data::Sah::Filter::perl::NumSeq::check_num_seq;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 1,
        summary => 'Check the syntax of number sequence',
        might_fail => 1,
    };
}

sub filter {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{modules}{"NumSeq::Iter"} //= 0.002;
    $res->{expr_filter} = join(
        "",
        "do { my \$tmp = $dt; my \$pres = NumSeq::Iter::numseq_parse(\$tmp); \$pres->[0] == 200 ? [undef, \$tmp] : [\$pres->[1], \$tmp] }",
    );

    $res;
}

1;
# ABSTRACT:

=for Pod::Coverage ^(meta|filter)$
