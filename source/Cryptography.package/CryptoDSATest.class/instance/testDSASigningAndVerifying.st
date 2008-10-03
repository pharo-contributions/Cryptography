DSA
testDSASigningAndVerifying
	| msg sig |
	msg := 'This is a test...'.
	sig := self dsaPrivateKey signMessage: msg.
	self assert: (self dsaPublicKey verify: sig isSignatureOf: msg)