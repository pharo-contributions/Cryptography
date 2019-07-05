Class {
	#name : #ASN1Null,
	#superclass : #ASN1Value,
	#category : 'ASN1-Objects'
}

{ #category : #'as yet unclassified' }
ASN1Null >> asn1Tag [

	^ 5

]

{ #category : #'as yet unclassified' }
ASN1Null >> isNil [

	^ true
]
