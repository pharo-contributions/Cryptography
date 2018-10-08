testing
isTypeFor: anObject

	^ self mapping notNil 
		ifTrue: [anObject isKindOf: self mapping]
		ifFalse: [anObject asn1Tag = self tag]
