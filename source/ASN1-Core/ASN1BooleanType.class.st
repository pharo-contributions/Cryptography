Class {
	#name : #ASN1BooleanType,
	#superclass : #ASN1BasicType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1BooleanType >> decodeValueWithDERStream: derStream length: length [

	^ derStream next > 0
]

{ #category : #encoding }
ASN1BooleanType >> encodeValue: anObject withDERStream: derStream [

	anObject 
		ifTrue: [derStream nextPut: 255]
		ifFalse: [derStream nextPut: 0].

]

{ #category : #testing }
ASN1BooleanType >> isTypeFor: anObject [

	^ anObject isKindOf: Boolean
]

{ #category : #encoding }
ASN1BooleanType >> sizeOfObject: anObject [

	^ 1

]

{ #category : #accessing }
ASN1BooleanType >> tag [

	^ 1
]
