See Handbook of Applied Cryptography, Ch. 8, p. 295.

Here we use the notation:
	p = modulo
	alpha = generator
	a = secretExponent

Decryption:
* Receive the ciphertext c = (gamma, delta).
* Use the private key to compute:
	gamma^(p-1-a) = gamma^(-a) = alpha^(-a*k) mod p
* Recover m = (gamma^(p-1-a)) * delta mod p

Signature generation:
* Select a random secret integer k between 1 and p-2, with gcd(k, p-1) = 1.
* Compute r = alpha^k mod p.
* Compute k^(-1) mod (p-1).
* Compute s = k^(-1) * ( h(m) - a*r ) mod (p-1), where h is a hash function.
* The signature for m is the pair (r,s).


