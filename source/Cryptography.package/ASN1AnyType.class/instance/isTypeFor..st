testing
isTypeFor: anObject

	^ (ASN1Stream tagToTypeDispatchTable
		detect: [:eachType | eachType isTypeFor: anObject]
		ifNone: [nil]) notNil
