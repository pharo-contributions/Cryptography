Class {
	#name : #ASN1BMPStringType,
	#superclass : #ASN1WrappedStringType,
	#category : 'ASN1-Types'
}

{ #category : #testing }
ASN1BMPStringType >> isTypeFor: anObject [

	^ anObject isKindOf: ASN1BMPString
]

{ #category : #accessing }
ASN1BMPStringType >> tag [

	^ 30
]

{ #category : #decoding }
ASN1BMPStringType >> wrapperClass [

	^ ASN1BMPString

]
