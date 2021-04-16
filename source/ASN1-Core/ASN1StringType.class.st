Class {
	#name : #ASN1StringType,
	#superclass : #ASN1OctetsType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1StringType >> decodeValueWithDERStream: derStream length: length [

	^(derStream next: length) asByteArray asString.

]

{ #category : #encoding }
ASN1StringType >> encodeValue: anObject withDERStream: derStream [

	derStream nextPutAll: anObject asByteArray
]

{ #category : #testing }
ASN1StringType >> isTypeFor: anObject [

	^ anObject isString
]

{ #category : #accessing }
ASN1StringType >> octetsClass [

	^ String
]

{ #category : #encoding }
ASN1StringType >> sizeOfObject: anObject [

	^ anObject size.

]

{ #category : #accessing }
ASN1StringType >> tag [

	^ 12
]
