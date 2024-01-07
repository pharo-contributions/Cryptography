Class {
	#name : #ASN1UniversalStringType,
	#superclass : #ASN1WrappedStringType,
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1UniversalStringType >> isTypeFor: anObject [

	^ anObject isKindOf: ASN1UniversalString
]

{ #category : #accessing }
ASN1UniversalStringType >> tag [

	^ 28
]

{ #category : #decoding }
ASN1UniversalStringType >> wrapperClass [

	^ ASN1UniversalString

]
