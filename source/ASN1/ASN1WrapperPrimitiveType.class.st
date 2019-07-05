Class {
	#name : #ASN1WrapperPrimitiveType,
	#superclass : #ASN1WrapperType,
	#category : 'ASN1-Types'
}

{ #category : #decoding }
ASN1WrapperPrimitiveType >> decodeValueWithDERStream: derStream length: length [

	| aValue |
	aValue := ASN1ExplicitContextValue new.
	aValue tagIndex: (derStream currentTag bitAnd: 2r00011111).
	aValue tagIsPrimitive: true.
	aValue tagValue: (derStream next: length).
	^aValue
	

]

{ #category : #encoding }
ASN1WrapperPrimitiveType >> encodeValue: anObject withDERStream: derStream [

	derStream nextPutAll: anObject tagValue.

]
