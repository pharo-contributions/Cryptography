converting
asASN1Value

	self decryptedBytes isNil 
		ifTrue: [self decrypt].
	^ ASN1Stream decodeBytes: self decryptedBytes.
