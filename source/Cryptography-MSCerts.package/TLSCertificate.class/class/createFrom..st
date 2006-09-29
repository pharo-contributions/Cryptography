instance creation
createFrom: anHttpRequestHandShake

	
	^self handShake: anHttpRequestHandShake serverHello handShake certificate: anHttpRequestHandShake x509v3Certificate
