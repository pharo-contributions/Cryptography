as yet unclassified
setupStates

	self securityParams requiresServerCertificate 
		ifTrue: [self machine addStateClass: SSLClientWaitingForCertificate].
	self securityParams requiresServerKeyExchange 
		ifTrue: [self machine addStateClass: SSLClientWaitingForKeyExchange].
	self machine addStateClass: SSLClientWaitingForServerHelloDone.
	self machine addStateClass: SSLClientWaitingForServerFinished.
	self machine addStateClass: SSLClientFinished.
