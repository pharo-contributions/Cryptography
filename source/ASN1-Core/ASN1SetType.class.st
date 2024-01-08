Class {
	#name : #ASN1SetType,
	#superclass : #ASN1UnmappedType,
	#category : #'ASN1-Core-Types'
}

{ #category : #accessing }
ASN1SetType >> containerClass [

	^ OrderedSet
]

{ #category : #accessing }
ASN1SetType >> tag [

	^ 49
]
