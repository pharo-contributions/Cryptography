printing
printOn: aStream
	aStream nextPutAll: 'OpenPGP '.
	aStream nextPutAll: (TagTypes at: self tag+1); nextPutAll: ', tag='.
	aStream print: self tag.
	"aStream nextPutAll: ', format='.
	aStream nextPutAll: (self isOldFormat ifTrue: ['old'] ifFalse: ['new'])."
	self version isNil ifFalse: [
		aStream nextPutAll: ', version='.
		self version printOn: aStream.
	].
	aStream nextPutAll: ', size='.
	aStream print: self dataSize.
	self isKeyPacket ifTrue: [
		aStream nextPutAll: ', created='.
		self printCreationDateAndTimeOn: aStream].
	self printDataOn: aStream.
	aStream cr