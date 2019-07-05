Class {
	#name : #ASN1SetType,
	#superclass : #ASN1UnmappedType,
	#category : 'ASN1-Types'
}

{ #category : #accessing }
ASN1SetType >> containerClass [

	^ OrderedSet
]

{ #category : #accessing }
ASN1SetType >> tag [

	^ 49
]
