Class {
	#name : #ASN1GeneralStringType,
	#superclass : #ASN1WrappedStringType,
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1GeneralStringType >> isTypeFor: anObject [

	^ anObject isKindOf: ASN1GeneralString
]

{ #category : #accessing }
ASN1GeneralStringType >> tag [

	^ 27
]

{ #category : #decoding }
ASN1GeneralStringType >> wrapperClass [

	^ ASN1GeneralString

]
