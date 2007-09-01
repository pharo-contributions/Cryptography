setup
setupServerDHReplyMsg: dhReplyMsg securityParams: securityParams

	dhReplyMsg publicHostKeyAndCertificates: ''.
	self f: diffieHellman sendMessage.
	dhReplyMsg f: self f.
	diffieHellman receiveMessage: self e.
	securityParams secretKey: diffieHellman sharedKey.
	self computeExchangeHashWithSecurityParams: securityParams.
	dhReplyMsg signature: ''.
