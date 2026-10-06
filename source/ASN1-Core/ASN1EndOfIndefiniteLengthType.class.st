Class {
	#name : #ASN1EndOfIndefiniteLengthType,
	#superclass : #ASN1BasicType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1EndOfIndefiniteLengthType >> decodeValueWithDERStream: derStream length: length [

	^ ASN1EndOfIndefiniteLengthMarker new
]

{ #category : #encoding }
ASN1EndOfIndefiniteLengthType >> encodeValue: anObject withDERStream: derStream [

]

{ #category : #testing }
ASN1EndOfIndefiniteLengthType >> isTypeFor: anObject [

	^ false
]

{ #category : #encoding }
ASN1EndOfIndefiniteLengthType >> sizeOfObject: anObject [

	^ 0

]

{ #category : #accessing }
ASN1EndOfIndefiniteLengthType >> tag [

	^ 0
]
