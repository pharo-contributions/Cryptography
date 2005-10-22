accessing
tag
	^self isOldFormat
		ifTrue: [(header bitShift: -2) bitAnd: 15]
		ifFalse: [header bitAnd: 63]