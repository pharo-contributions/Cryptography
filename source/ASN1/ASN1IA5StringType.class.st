Class {
	#name : #ASN1IA5StringType,
	#superclass : #ASN1WrappedStringType,
	#category : 'ASN1-Types'
}

{ #category : #testing }
ASN1IA5StringType >> isTypeFor: anObject [

	^ anObject isKindOf: ASN1IA5String
]

{ #category : #accessing }
ASN1IA5StringType >> tag [

	^ 22
]

{ #category : #decoding }
ASN1IA5StringType >> wrapperClass [

	^ ASN1IA5String

]
