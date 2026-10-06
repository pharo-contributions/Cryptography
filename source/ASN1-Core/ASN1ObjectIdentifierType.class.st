Class {
	#name : #ASN1ObjectIdentifierType,
	#superclass : #ASN1BasicType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1ObjectIdentifierType >> decodeValueWithDERStream: derStream length: length [

	| b oid len |
	b := derStream next.
	oid := (b // 40) asString , '.' , (b rem: 40) asString.
	len := 0.
	2 to: length do: [ :i | 
		b := derStream next.
		(b bitAnd: 16r80) = 16r80
			ifTrue: [ len := (len bitShift: 7) + (b bitAnd: 16r7F) ]
			ifFalse: [ 
				len := (len bitShift: 7) + b.
				oid := oid , '.' , len asString.
				len := 0 ] ].
	^ ASN1ObjectId fromString: oid
]

{ #category : #encoding }
ASN1ObjectIdentifierType >> encode: anObject withDERStream: derStream [
	"For a speedup"

	| bytes |
	derStream nextPutTag: anObject asn1Tag.
	bytes := anObject asByteArray.
	derStream nextPutLength: bytes size.
	derStream nextPutAll: bytes.
	^ derStream

]

{ #category : #encoding }
ASN1ObjectIdentifierType >> encodeValue: anObject withDERStream: derStream [

	| bytes |
	bytes := anObject asByteArray.
	derStream nextPutAll: bytes.
	^ derStream

]

{ #category : #testing }
ASN1ObjectIdentifierType >> isTypeFor: anObject [

	^ anObject isKindOf: ASN1ObjectId
]

{ #category : #encoding }
ASN1ObjectIdentifierType >> sizeOfObject: anObject [

	^ anObject asByteArray size
]

{ #category : #accessing }
ASN1ObjectIdentifierType >> tag [

	^ 6
]
