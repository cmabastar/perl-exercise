#!/usr/bin/perl
use strict;
use warnings;
use Crypt::RSA;
use Crypt::RSA::Key::Private;
use MIME::Base64;
use Dancer;

use Common qw($PASSPHRASE);
use Math::Prime::Util qw(nth_prime);

set logger => 'console';
my $rsa = new Crypt::RSA;
my $private =  new Crypt::RSA::Key::Private( Filename => 'private.key');

use Data::Dumper;
any ['get', 'post'] => '/' => sub {
    my $decode = decode_base64(params->{passphrase});
    my $message = $rsa->decrypt( Ciphertext => $decode ,Key => $private) || die $rsa->errstr();

    if ($message eq $PASSPHRASE) {
        debug 'Passphrase correct: ', $PASSPHRASE;
        if ( params->{number} > 1 && params->{number} <= 10000 ) {
            my $p  = nth_prime(params->{number});
            debug 'Prime ', $p;
            return $p;
        }
    } else {
        "Invalid Passphrase";
    }
};



Dancer->dance;
