Class {
	#name : #ASN1BasicType,
	#superclass : #ASN1Type,
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1BasicType class >> isAbstract [

	^ self == ASN1BasicType
]
