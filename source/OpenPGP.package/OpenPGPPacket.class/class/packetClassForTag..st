accessing
packetClassForTag: anInteger
	anInteger = 0 ifTrue: [self error: 'invalid packet tag value'].
	anInteger = 1 ifTrue: [^OpenPGPPublicKeyEncryptedSessionKeyPacket].
	anInteger = 2 ifTrue: [^OpenPGPSignaturePacket].
	anInteger = 3 ifTrue: [^OpenPGPSymmetricKeyEncryptedSessionKeyPacket].
	anInteger = 4 ifTrue: [^OpenPGPOnePassSignaturePacket].
	anInteger = 5 ifTrue: [^OpenPGPSecretKeyPacket].
	anInteger = 6 ifTrue: [^OpenPGPPublicKeyPacket].
	anInteger = 7 ifTrue: [^OpenPGPSecretSubkeyPacket].
	anInteger = 8 ifTrue: [^OpenPGPCompressedDataPacket].
	anInteger = 9 ifTrue: [^OpenPGPSymmetricallyEncryptedDataPacket].
	anInteger = 10 ifTrue: [^OpenPGPMarkerPacket].
	anInteger = 11 ifTrue: [^OpenPGPLiteralDataPacket].
	anInteger = 12 ifTrue: [^OpenPGPTrustPacket].
	anInteger = 13 ifTrue: [^OpenPGPUserIDPacket].
	anInteger = 14 ifTrue: [^OpenPGPPublicSubkeyPacket].
	anInteger = 17 ifTrue: [^OpenPGPPhotoIDPacket].
	^self