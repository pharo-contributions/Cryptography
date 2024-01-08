Class {
	#name : #ASN1ByteArrayType,
	#superclass : #ASN1OctetsType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1ByteArrayType >> decodeValueWithDERStream: derStream length: length [

	^(derStream next: length) asByteArray
]

{ #category : #encoding }
ASN1ByteArrayType >> encodeValue: anObject withDERStream: derStream [

	derStream nextPutAll: anObject
]

{ #category : #testing }
ASN1ByteArrayType >> isTypeFor: anObject [

	^ anObject isKindOf: ByteArray
]

{ #category : #accessing }
ASN1ByteArrayType >> octetsClass [

	^ ByteArray
]

{ #category : #encoding }
ASN1ByteArrayType >> sizeOfObject: anObject [

	^ anObject size

]

{ #category : #accessing }
ASN1ByteArrayType >> tag [

	^ 4
]
