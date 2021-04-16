Class {
	#name : #ASN1BitStringType,
	#superclass : #ASN1OctetsType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1BitStringType >> decodeValueWithDERStream: derStream length: length [

	| bitString |
	bitString := ASN1BitString new.
	bitString bitsPadding: derStream next.
	bitString bytes: (derStream next: length - 1).
	^ bitString

]

{ #category : #encoding }
ASN1BitStringType >> encodeValue: anObject withDERStream: derStream [

	derStream 
		nextPut: anObject bitsPadding;
		nextPutAll: anObject bytes asByteArray.

]

{ #category : #testing }
ASN1BitStringType >> isTypeFor: anObject [

	^ anObject isKindOf: ASN1BitString
]

{ #category : #accessing }
ASN1BitStringType >> octetsClass [

	^ ASN1BitString
]

{ #category : #encoding }
ASN1BitStringType >> sizeOfObject: anObject [

	^ anObject bytes size + 1
]

{ #category : #accessing }
ASN1BitStringType >> tag [

	^ 3
]
