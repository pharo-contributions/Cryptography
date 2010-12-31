as yet unclassified
= anObject

	(anObject isKindOf: self class) ifFalse: [^false].
	^ self asAsn1Bytes = anObject asAsn1Bytes