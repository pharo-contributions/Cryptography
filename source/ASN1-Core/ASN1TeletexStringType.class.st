Class {
	#name : #ASN1TeletexStringType,
	#superclass : #ASN1WrappedStringType,
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1TeletexStringType >> isTypeFor: anObject [

	^ anObject isKindOf: ASN1TeletexString
]

{ #category : #accessing }
ASN1TeletexStringType >> tag [

	^ 20
]

{ #category : #decoding }
ASN1TeletexStringType >> wrapperClass [

	^ ASN1TeletexString

]
