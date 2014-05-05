package Common;
use base 'Exporter';
our @EXPORT_OK = qw( $PASSPHRASE fib);

use  Memoize;

our  $PASSPHRASE = 'LOLOLOLOLOLO';

memoize('fib');

sub fib {
   my $n = shift;
   return $n if $n < 2;
   return fib($n - 1) + fib($n - 2);
}


1;
