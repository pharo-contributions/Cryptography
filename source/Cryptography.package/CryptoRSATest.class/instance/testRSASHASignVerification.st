tests
testRSASHASignVerification

	| signBytes |
	
	signBytes := privateKey v15SignMessage: 'hello'.  
	
	self assert: (publicKey v15Verify: signBytes isSignatureOf: 'hello')