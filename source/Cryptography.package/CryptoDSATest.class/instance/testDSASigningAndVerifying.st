DSA
testDSASigningAndVerifying
	| msg sig |
	msg _ 'This is a test...'.
	sig _ self dsaPrivateKey signMessage: msg.
	self assert: (self dsaPublicKey verify: sig isSignatureOf: msg)