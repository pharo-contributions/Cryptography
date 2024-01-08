Class {
	#name : #ASN1Value,
	#superclass : #Object,
	#category : #'ASN1-Core-Objects'
}

{ #category : #testing }
ASN1Value class >> isAbstract [

	^ self == ASN1Value
]

{ #category : #'private - parsing' }
ASN1Value >> asAsn1Bytes [

	^ ASN1Stream encode: self

]
