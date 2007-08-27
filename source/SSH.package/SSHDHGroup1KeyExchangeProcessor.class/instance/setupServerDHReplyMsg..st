setup
setupServerDHReplyMsg: dhReplyMsg

	dhReplyMsg publicHostKeyAndCertificates: ''.
	dhReplyMsg f: diffieHellman sendMessage.
	dhReplyMsg signature: ''.
	diffieHellman receiveMessage: e.
