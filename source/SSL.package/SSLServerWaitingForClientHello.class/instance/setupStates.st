process
setupStates

	self securityParams requiresClientCertificate 
		ifTrue: [self machine addStateClass: SSLServerWaitingForCertificate].
	self machine addStateClass: SSLServerWaitingForKeyExchange.
	self securityParams requiresClientCertificate 
		ifTrue: [self machine addStateClass: SSLServerWaitingForCertificateVerify].
	self machine addStateClass: SSLServerWaitingForClientFinished.
	self machine addStateClass: SSLServerFinished.
