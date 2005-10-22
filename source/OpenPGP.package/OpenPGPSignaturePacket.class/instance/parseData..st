initialize-release
parseData: aStream
	version := aStream next.
	version <= 3 ifTrue: [
		aStream next = 5 ifFalse: [self error: 'This number must be 5. See RFC 2440'].
		signatureType := aStream next.
		creationTime := aStream nextNumber: 4.
		signer := aStream next: 8.
		publicKeyAlgorithm := aStream next.
		hashAlgorithm := aStream next.
		msbOfHash := aStream nextNumber: 2.
		mpis := aStream mpisUpToEnd].
	version = 4 ifTrue: [
		signatureType := aStream next.
		publicKeyAlgorithm := aStream next.
		hashAlgorithm := aStream next.
		hashedSubpacketData := aStream nextSubpacketData.
		unhashedSubpacketData := aStream nextSubpacketData.
		msbOfHash := aStream nextNumber: 2.
		mpis := aStream mpisUpToEnd.
		self subpackets: hashedSubpacketData do: [:subdata |
			subdata first = 2 ifTrue: [
				creationTime := (OpenPGPStream on: subdata)
				next: 1; nextNumber: 4]].
		self subpackets: unhashedSubpacketData do: [:subdata |
			subdata first = 16 ifTrue: [
				signer := subdata copyFrom: 2 to: subdata size]]]