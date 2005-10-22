reading
readFrom: aStream
	aStream next = 4 ifFalse: [self error: 'version type mismatch'].
	signatureType := aStream next.
	publicKeyAlgorithm := aStream next.
	hashAlgorithm := aStream next.
	hashedSubpacketData := aStream nextSubpacketData.
	unhashedSubpacketData := aStream nextSubpacketData.
	msbOfHash := aStream nextNumber: 2.
	mpis := aStream mpisUpToEnd