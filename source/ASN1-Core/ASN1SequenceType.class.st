Class {
	#name : #ASN1SequenceType,
	#superclass : #ASN1UnmappedType,
	#category : #'ASN1-Core-Types'
}

{ #category : #accessing }
ASN1SequenceType >> containerClass [

	^ OrderedCollection
]

{ #category : #accessing }
ASN1SequenceType >> tag [

	^ 48
]
