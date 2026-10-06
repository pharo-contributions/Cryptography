Class {
	#name : #ASN1NullType,
	#superclass : #ASN1BasicType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1NullType >> decodeValueWithDERStream: derStream length: length [

	^ ASN1Null new
]

{ #category : #encoding }
ASN1NullType >> encodeValue: anObject withDERStream: derStream [


]

{ #category : #testing }
ASN1NullType >> isTypeFor: anObject [

	^ anObject isNil
]

{ #category : #encoding }
ASN1NullType >> sizeOfObject: anObject [

	^ 0
]

{ #category : #accessing }
ASN1NullType >> tag [

	^ 5
]
