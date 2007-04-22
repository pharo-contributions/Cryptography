secret
installKeysFromKeyBlock: keyBlock

	| keyBlockStream clientWriteMACKey serverWriteMACKey clientWriteKey serverWriteKey clientWriteIV serverWriteIV |
	keyBlockStream := keyBlock readStream.
	clientWriteMACKey := keyBlockStream next: self securityParams hashSize.
	serverWriteMACKey := keyBlockStream next: self securityParams hashSize.
	clientWriteKey := keyBlockStream next: self securityParams keyMaterialLength.
	serverWriteKey := keyBlockStream next: self securityParams keyMaterialLength.
	clientWriteIV := keyBlockStream next: self securityParams ivSize.
	serverWriteIV := keyBlockStream next: self securityParams ivSize.

	self securityParams isClient
		ifTrue: [self 
			installKeyWithCipherReadKey: serverWriteKey 
			cipherWriteKey: clientWriteKey 
			macReadKey: serverWriteMACKey 
			macWriteKey: clientWriteMACKey
			ivReadKey: serverWriteIV
			ivWriteKey: clientWriteIV]
		ifFalse: [self 
			installKeyWithCipherReadKey: clientWriteKey 
			cipherWriteKey: serverWriteKey 
			macReadKey: clientWriteMACKey 
			macWriteKey: serverWriteMACKey
			ivReadKey: clientWriteIV
			ivWriteKey: serverWriteIV].



