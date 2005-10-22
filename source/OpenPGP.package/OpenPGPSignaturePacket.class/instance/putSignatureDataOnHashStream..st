verifying
putSignatureDataOnHashStream: aStream
	version = 3 ifTrue: [
		aStream
			nextPut: signatureType;
			nextNumber: 4 put: creationTime].
	version = 4 ifTrue: [
		aStream
			nextPut: 4;
			nextPut: signatureType;
			nextPut: publicKeyAlgorithm;
			nextPut: hashAlgorithm.
		aStream
			nextNumber: 2 put: hashedSubpacketData size;
			nextPutAll: hashedSubpacketData.
		aStream
			nextPut: 4;
			nextPut: 16rFF;
			nextNumber: 4 put: hashedSubpacketData size + 6]