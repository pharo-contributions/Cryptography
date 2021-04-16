Class {
	#name : #ASN1AssignmentSubType,
	#superclass : #ASN1SubType,
	#category : #'ASN1-Core-Types'
}

{ #category : #decoding }
ASN1AssignmentSubType >> decodeWithDERStream: derStream [

	^ self parent decodeWithDERStream: derStream.

]

{ #category : #encoding }
ASN1AssignmentSubType >> encode: anObject withDERStream: derStream [

	^ self parent encode: anObject withDERStream: derStream.

]

{ #category : #testing }
ASN1AssignmentSubType >> matchesTag: anInteger [

	^ self parent matchesTag: anInteger
]
