Class {
	#name : #ASN1Type,
	#superclass : #ASN1Entity,
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1Type class >> isAbstract [

	^ self == ASN1Type
]

{ #category : #accessing }
ASN1Type >> asn1Tag [

	^ self tag
]

{ #category : #decoding }
ASN1Type >> decodeValueWithDERStream: derStream length: length [

	^ self subclassResponsibility
]

{ #category : #decoding }
ASN1Type >> decodeWithDERStream: derStream [

	| tag |
	tag := derStream nextTag.
	(self matchesTag: tag) ifFalse: [ 
		self error: 'asn1 decoder: bad tag' ].
	^ self
		  decodeValueWithDERStream: derStream
		  length: derStream nextLength
]

{ #category : #decoding }
ASN1Type >> decodeWithDERStream: derStream owner: owner ownerType: ownerType [

	^ self decodeWithDERStream: derStream
]

{ #category : #encoding }
ASN1Type >> encode: anObject withDERStream: derStream [

	| size |
	derStream nextPutTag: anObject asn1Tag.
	size := self sizeOfObject: anObject.
	derStream nextPutLength: size.
	self encodeValue: anObject withDERStream: derStream.
	^ derStream
]

{ #category : #encoding }
ASN1Type >> encode: anObject withDERStream: derStream owner: owner ownerType: ownerType [

	^ self encode: anObject withDERStream: derStream

]

{ #category : #encoding }
ASN1Type >> encodeValue: anObject withDERStream: derStream [

	^ self subclassResponsibility
]

{ #category : #testing }
ASN1Type >> isConstructed [

	^ false
]

{ #category : #testing }
ASN1Type >> isTypeFor: anObject [

	^((self asn1Tag bitXor: anObject asn1Tag) bitAnd: 2r00011111) isZero
]

{ #category : #testing }
ASN1Type >> matchesTag: anInteger [

	^((self asn1Tag bitXor: anInteger) bitAnd: 2r00011111) isZero
]

{ #category : #accessing }
ASN1Type >> parent [

	^ nil
]

{ #category : #encoding }
ASN1Type >> sizeOfObject: anObject [

	^ nil
]

{ #category : #accessing }
ASN1Type >> tag [

	^ self subclassResponsibility
]
