verifying
putSignatureDataOnHashStream: aStream
	aStream
		nextPut: signatureType;
		nextNumber: 4 put: creationTime