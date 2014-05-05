#!/usr/bin/perl
# Create a user agent object
use strict;
use warnings;

use LWP::UserAgent;
use Crypt::RSA;
use MIME::Base64;
use Crypt::RSA::Key::Public;
use Math::Prime::Util qw(nth_prime);
use Common qw(fib);

my $passphrase = 'LOLOLOLOLOLO'; # This should be the same with the server after decoding
my $number = $ARGV[0] || 10; #To be passed in the prime/fibonacci; 1 < N < 10000
my $pubkey = new Crypt::RSA::Key::Public ( Filename => 'public.key');   
my $rsa = new Crypt::RSA;

my $ua = LWP::UserAgent->new;
$ua->agent("MyApp/0.1 ");

# Create a request
my $encoded = encode_base64($rsa->encrypt( Message => $passphrase , Key => $pubkey), "");
my %query_hash = ( number => $number , passphrase => $encoded );

my $resp = $ua->post('http://localhost:3000/', \%query_hash);

print $resp->content . "\n";

# Reply if the prime number returned is the same
if ($resp->content == nth_prime($number)) {
    # Do fibonacci
    print "Fibonacci: ", fib($number), "\n";
    
}
