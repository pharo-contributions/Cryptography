reading
parseData: aStream
	version := aStream next.
	creationTime := aStream nextNumber: 4.
	version <= 3 ifTrue: [
		validDays := aStream nextNumber: 2.
		publicKeyAlgorithm := aStream next.
		algorithmSpecificData := (OpenPGPPublicKeyAlgorithmData forPGPAlgorithmID: publicKeyAlgorithm) readFrom: aStream].
	version = 4 ifTrue: [
		publicKeyAlgorithm := aStream next.
		algorithmSpecificData := (OpenPGPPublicKeyAlgorithmData forPGPAlgorithmID: publicKeyAlgorithm) readFrom: aStream]