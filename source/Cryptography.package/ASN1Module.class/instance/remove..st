services
remove: aType

	self definitions removeKey: aType name.
	aType module: nil.
	^aType