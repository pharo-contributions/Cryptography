secret
installKeysFromKeyBlock: keyBlock

	| keyBlockStream clientWriteMACKey serverWriteMACKey clientWriteKey serverWriteKey |
	keyBlockStream := keyBlock readStream.
	clientWriteMACKey := keyBlockStream next: self securityParams hashSize.
	serverWriteMACKey := keyBlockStream next: self securityParams hashSize.
	clientWriteKey := keyBlockStream next: self securityParams keyMaterialLength.
	serverWriteKey := keyBlockStream next: self securityParams keyMaterialLength.

	self securityParams isClient
		ifTrue: [self 
			installKeyWithCipherReadKey: serverWriteKey 
			cipherWriteKey: clientWriteKey 
			macReadKey: serverWriteMACKey 
			macWriteKey: clientWriteMACKey]
		ifFalse: [self 
			installKeyWithCipherReadKey: clientWriteKey 
			cipherWriteKey: serverWriteKey 
			macReadKey: clientWriteMACKey 
			macWriteKey: serverWriteMACKey].



