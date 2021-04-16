Class {
	#name : #ASN1ConstructedType,
	#superclass : #ASN1Type,
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1ConstructedType class >> isAbstract [

	^ self == ASN1ConstructedType
]

{ #category : #encoding }
ASN1ConstructedType >> encode: anObject withDERStream: derStream [

	| tempStream |
	derStream nextPutTag: self asn1Tag.
	tempStream := derStream newStream.
	self encodeValue: anObject withDERStream: tempStream.
	derStream nextPutLength: tempStream size.
	derStream nextPutAll: tempStream contents.
	^ derStream

]

{ #category : #testing }
ASN1ConstructedType >> isConstructed [

	^ true
]

{ #category : #encoding }
ASN1ConstructedType >> sizeOfObject: anObject [

	^ nil
]
