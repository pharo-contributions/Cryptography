tests
testSignVerificationByGeneratedKeys

	| signBytes gen |
	gen := RSAKeyPairGenerator bits: 1024.	
	gen computePrimes.
	
	signBytes := gen privateKey v15SignMessage: 'hello'.  
	
	self assert: (gen publicKey v15Verify: signBytes isSignatureOf: 'hello')