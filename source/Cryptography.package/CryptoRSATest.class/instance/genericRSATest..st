RSA
genericRSATest: bits
	| generator public private msg c |
	generator _ RSAKeyPairGenerator new bits: bits.
	public _ generator publicKey. "this may take a while"
	private _ generator privateKey.

	msg _ 1234567890987654321. "the plaintext"
	
c _ public crypt: msg. "the ciphertext (print it and take a look)"
	self assert: (private crypt: c) = msg