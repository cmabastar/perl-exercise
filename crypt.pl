#/usr/bin/perl

# Simple private key generation.
# To be later for encoding/decoding data

use Crypt::RSA;
$rsa = new Crypt::RSA;
($public, $private) = $rsa->keygen( Size => 2048 );

$public->write( Filename => 'public.key'  );
$private->write( Filename => 'private.key'  );
