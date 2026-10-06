Class {
	#name : #ASN1PrintableStringType,
	#superclass : #ASN1WrappedStringType,
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1PrintableStringType >> isTypeFor: anObject [

	^ anObject isKindOf: ASN1PrintableString
]

{ #category : #accessing }
ASN1PrintableStringType >> tag [

	^ 19
]

{ #category : #decoding }
ASN1PrintableStringType >> wrapperClass [

	^ ASN1PrintableString

]
