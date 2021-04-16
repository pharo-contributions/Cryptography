Class {
	#name : #ASN1WrapperType,
	#superclass : #ASN1Type,
	#category : #'ASN1-Core-Types'
}

{ #category : #testing }
ASN1WrapperType >> matchesTag: anInteger [

	^ (anInteger bitAnd: 2r11000000) isZero not

]
