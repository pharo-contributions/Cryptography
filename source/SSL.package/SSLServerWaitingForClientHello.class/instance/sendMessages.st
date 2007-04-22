process
sendMessages

	self addMsgSenderClass: SSLServerSendHello.
	self securityParams requiresServerCertificate 
		ifTrue: [self addMsgSenderClass: SSLServerSendCertificate].
	self securityParams requiresServerKeyExchange
		ifTrue: [self addMsgSenderClass: SSLServerSendKeyExchange].
	self securityParams requiresClientCertificate 
		ifTrue: [self addMsgSenderClass: SSLServerSendCertificateRequest].
	self addMsgSenderClass: SSLServerSendHelloDone.
