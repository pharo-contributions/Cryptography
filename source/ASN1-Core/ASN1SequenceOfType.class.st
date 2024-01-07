Class {
	#name : #ASN1SequenceOfType,
	#superclass : #ASN1UnstructuredType,
	#category : #'ASN1-Core-Types'
}

{ #category : #accessing }
ASN1SequenceOfType >> containerClass [

	^ OrderedCollection
]

{ #category : #accessing }
ASN1SequenceOfType >> tag [

	^ 48
]
