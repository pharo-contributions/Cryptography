parsing
asn1Tag

	^ self tagIsPrimitive
		ifTrue: [128 bitOr: self tagIndex]
		ifFalse: [160 bitOr: self tagIndex].
