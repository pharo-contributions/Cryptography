The ElGamal public-key encryption scheme is related to the Diffie-Hellman key agreement. Their security is based on the intractability of the same number theoretic problems (the discrete logarithm problem and the Diffie-Hellman problem).

See Handbook of Applied Cryptography, Ch. 8, p. 294.

Key generation:
* Generate a large random prime p and a generator alpha of the multiplicative group Zp* of the integers modulo p
* Select a random integer a between 1 and p-2, and compute alpha^a mod p
* The public key is (p, alpha, alpha^a)
  The private key is a

Example of encryption:
| elgamal pub priv c |
elgamal _ ElGamalKeyGenerator new.
elgamal generateKeysOfSize: 15.
pub _ elgamal publicKey.
priv _ elgamal privateKey.
c _ pub encryptElement: 31.
priv decryptElement: c.


Example of signature:
| elgamal pub priv signature |
elgamal _ ElGamalKeyGenerator new.
elgamal generateKeysOfSize: 15.
pub _ elgamal publicKey.
priv _ elgamal privateKey.
signature _ priv signMessage: 'hello'.
pub verifySignature: signature onMessage: 'hello'.

