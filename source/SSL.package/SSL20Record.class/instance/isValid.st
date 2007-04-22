queries
isValid

	(self length < 16384)
		ifFalse: [^ false].
	^ true.
