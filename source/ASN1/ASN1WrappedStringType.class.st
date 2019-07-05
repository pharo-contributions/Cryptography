Class {
	#name : #ASN1WrappedStringType,
	#superclass : #ASN1OctetsType,
	#category : 'ASN1-Types'
}

{ #category : #decoding }
ASN1WrappedStringType >> decodeValueWithDERStream: derStream length: length [

	| string |
	string := (derStream next: length) asByteArray asString.
	^ self wrapperClass fromString: string.

]

{ #category : #encoding }
ASN1WrappedStringType >> encodeValue: anObject withDERStream: derStream [

	derStream nextPutAll: anObject string asByteArray
]

{ #category : #accessing }
ASN1WrappedStringType >> octetsClass [

	^ self wrapperClass
]

{ #category : #encoding }
ASN1WrappedStringType >> sizeOfObject: anObject [

	^ anObject string size.

]
