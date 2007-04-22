decoding
decodeWithDERStream: derStream

	| thisTag |
	thisTag := derStream nextTag.
	(self parent isConstructed not and: [(thisTag bitAnd: 2r00100000) > 0])
		ifTrue: [^ self parent 
			decodeConstructedValueWithDERStream: derStream 
			length: derStream nextLength]
		ifFalse: [^ self parent 
			decodeValueWithDERStream: derStream 
			length: derStream nextLength].
