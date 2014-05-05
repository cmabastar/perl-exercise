use Crypt::RSA;
use MIME::Base64;
my $rsa = new Crypt::RSA;
my ($public, $private) = $rsa->keygen( Size => 2048) ;
my $m = 'Hey its real';
my $c = $rsa->encrypt( Message => $m, Key => $public );
my $enc = encode_base64($c);
print $enc;

$message = $rsa->decrypt( Ciphertext => decode_base64($enc), Key => $private );
print $message;
