perl-exercise
=============
## Description
Sending RSA encryption via HTTP POST using LWP, RSA::Crypt and decrypting on the other end. 

Built using:
- perl 5.16
- FreeBSD 10.0 release

## Requirements
Install the following via CPAN:
- Dancer
- LWP
- Crypt::RSA
- Math::Prime::Util

## Generating Key Pair
(Optional) Creating private.key and public.key and save it to files.

	./crypt.pl
    
## Running server

	# ./server.pl
	>> Dancer 1.3123 server 3466 listening on http://0.0.0.0:3000
	== Entering the development dance floor ...

## Running Client
	
    # ./client.pl
    Fibonacci: 55
    
Passing number N as argv:

    # ./client 20
	Fibonacci: 6765