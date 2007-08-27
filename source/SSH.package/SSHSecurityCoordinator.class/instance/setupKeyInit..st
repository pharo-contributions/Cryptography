key init
setupKeyInit: keyInitMsg

	keyInitMsg 
		cookie: (SecureRandom new nextBytes: 16);
		keyExchangeAlgorithms: #('diffie-hellman-group1-sha1');
		serverHostKeyAlgorithms: #('ssh-dss');
		encryptionAlgorithmsClientToServer: #('3des-cbc');
		encryptionAlgorithmsServerToClient: #('3des-cbc');
		macAlgorithmsClientToServer: #('hmac-sha1');
		macAlgorithmsServerToClient: #('hmac-sha1');
		compressionAlgorithmsClientToServer: #('none');
		compressionAlgorithmsServerToClient: #('none');
		languagesClientToServer: #();
		languagesServerToClient: #();
		firstKeyExchangePacketFollows: false.
	self isClient
		ifTrue: [self securityParams clientKeyInit: keyInitMsg]
		ifFalse: [self securityParams serverKeyInit: keyInitMsg].
	^ keyInitMsg
