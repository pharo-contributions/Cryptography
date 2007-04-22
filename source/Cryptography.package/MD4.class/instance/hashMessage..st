accessing
hashMessage: aStringOrByteArray
	self input: aStringOrByteArray asByteArray.
	self run.
	^ self output