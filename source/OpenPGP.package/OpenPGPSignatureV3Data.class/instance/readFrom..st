reading
readFrom: aStream
	aStream next = 3 ifFalse: [self error: 'version number mismatch'].
	aStream next = 5 ifFalse: [self error: 'This number must be 5. See RFC 2440'].
	signatureType := aStream next.
	creationTime := aStream nextNumber: 4.
	signer := aStream next: 8.
	publicKeyAlgorithm := aStream next.
	hashAlgorithm := aStream next.
	msbOfHash := aStream nextNumber: 2.
	mpis := aStream mpisUpToEnd