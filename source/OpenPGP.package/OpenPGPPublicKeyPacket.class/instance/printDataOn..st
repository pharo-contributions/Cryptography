printing
printDataOn: aStream
	aStream nextPutAll: ', id='.
	aStream nextPutAll: self keyIDHex.
	aStream nextPutAll: ', fingerprint= '.
	aStream nextPutAll: self fingerprintHex.
	self userIDs first printDataOn: aStream