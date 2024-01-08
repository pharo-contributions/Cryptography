Class {
	#name : #ASN1AnyType,
	#superclass : #ASN1BasicType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1AnyType >> decodeWithDERStream: derStream [

	^ derStream decode
]

{ #category : #encoding }
ASN1AnyType >> encode: anObject withDERStream: derStream [

	derStream encode: anObject
]

{ #category : #testing }
ASN1AnyType >> isTypeFor: anObject [

	^ (ASN1Stream tagToTypeDispatchTable
		   detect: [ :eachType | eachType isTypeFor: anObject ]
		   ifNone: [ nil ]) notNil
]

{ #category : #testing }
ASN1AnyType >> matchesTag: anInteger [

	^ (anInteger bitAnd: 2r11000000) isZero

]

{ #category : #accessing }
ASN1AnyType >> tag [

	^ nil
]
