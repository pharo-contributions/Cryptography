process
processServerDHReplyMsg: dhReplyMsg securityParams: securityParams

	securityParams hostPublicKey: dhReplyMsg publicHostKeyAndCertificates.
	self f: dhReplyMsg f.
	diffieHellman receiveMessage: self f.
	securityParams secretKey: diffieHellman sharedKey.
	self computeExchangeHashWithSecurityParams: securityParams.
	(securityParams hostPublicKey 
		verifySignature: dhReplyMsg signature 
		ofMessageHash: (SHA1 hashMessage: securityParams exchangeHash))
			ifFalse: [self error: 'bad signature'].


