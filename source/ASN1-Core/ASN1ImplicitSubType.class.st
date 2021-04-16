Class {
	#name : #ASN1ImplicitSubType,
	#superclass : #ASN1SubType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1ImplicitSubType >> decodeWithDERStream: derStream [

	| thisTag |
	thisTag := derStream nextTag.
	(self parent isConstructed not and: [ 
		 (thisTag bitAnd: 2r00100000) > 0 ])
		ifTrue: [ 
			^ self parent
				  decodeConstructedValueWithDERStream: derStream
				  length: derStream nextLength ]
		ifFalse: [ 
			^ self parent
				  decodeValueWithDERStream: derStream
				  length: derStream nextLength ]
]

{ #category : #encoding }
ASN1ImplicitSubType >> encode: anObject withDERStream: derStream [

	| myTag tempStream |
	myTag := self asn1Tag bitOr: 128.
	self parent isConstructed ifTrue: [ myTag := myTag bitOr: 32 ].
	derStream nextPutTag: myTag.
	tempStream := derStream newStream.
	self parent encodeValue: anObject withDERStream: tempStream.
	derStream nextPutLength: tempStream size.
	derStream nextPutAll: tempStream contents
]
