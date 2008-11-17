process
sendMessages

	self securityParams requiresClientCertificate 
		ifTrue: [self addMsgSenderClass: SSLClientSendCertificate].
	self addMsgSenderClass: SSLClientSendKeyExchange.
	self securityParams requiresClientCertificateVerify 
		ifTrue: [self addMsgSenderClass: SSLClientSendCertificateVerify].
	self addMsgSenderClass: SSLSendChangeCipherSpec.
	self addMsgSenderClass: SSLClientSendFinished.
