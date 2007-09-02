setup
setupServerDHReplyMsg: dhReplyMsg securityParams: securityParams

	dhReplyMsg publicHostKeyAndCertificates: securityParams hostPublicKey.
	self f: diffieHellman sendMessage.
	dhReplyMsg f: self f.
	diffieHellman receiveMessage: self e.
	securityParams secretKey: diffieHellman sharedKey.
	self computeExchangeHashWithSecurityParams: securityParams.
	dhReplyMsg signature: (securityParams hostPrivateKey 
		computeSignatureForMessageHash: (SHA1 hashMessage: securityParams exchangeHash)).
