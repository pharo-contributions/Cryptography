Class {
	#name : #ASN1SetOfType,
	#superclass : #ASN1UnstructuredType,
	#category : #'ASN1-Core-Types'
}

{ #category : #accessing }
ASN1SetOfType >> containerClass [

	^ OrderedSet
]

{ #category : #accessing }
ASN1SetOfType >> tag [

	^ 49
]
