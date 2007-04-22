See Handbook of Applied Cryptography, Ch. 8, p. 295.

Here we use the notation:
	p = modulo
	alpha = generator
	alpha^a = generatorRaisedToA

Encryption:
* Obtain A's public key (p, alpha, alpha^a).
* Represent the message as an integer m between 0 and p-1.
* Select a random integer k between 1 and p-2.
* Compute:
		gamma = alpha^k mod p
		delta = m * (alpha^a)^k mod p.
* Send the ciphertext c = (gamma, delta).

Signature verification:
* Obtain A's public key (p, alpha, alpha^a).
* Verify that r is between 1 and p-1, if not then reject the signature.
* Compute v1 = (alpha^a)^r * r^s mod p.
* Compute h(m) where h is a hash function
* Compute v2 = alpha^h(m) mod p.
* Accept the signature if and only if v1=v2.

