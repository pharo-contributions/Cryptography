Class {
	#name : #ASN1VisibleStringType,
	#superclass : #ASN1WrappedStringType,
	#category : 'ASN1-Types'
}

{ #category : #testing }
ASN1VisibleStringType >> isTypeFor: anObject [

	^ anObject isKindOf: ASN1VisibleString
]

{ #category : #accessing }
ASN1VisibleStringType >> tag [

	^ 26
]

{ #category : #decoding }
ASN1VisibleStringType >> wrapperClass [

	^ ASN1VisibleString

]
