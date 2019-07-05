Class {
	#name : #X509NameConstraints,
	#superclass : #Object,
	#instVars : [
		'permittedSubtrees',
		'excludedSubtrees'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509NameConstraints >> excludedSubtrees [
	"Answer the value of excludedSubtrees"

	^ excludedSubtrees
]

{ #category : #accessing }
X509NameConstraints >> excludedSubtrees: anObject [
	"Set the value of excludedSubtrees"

	excludedSubtrees := anObject
]

{ #category : #accessing }
X509NameConstraints >> permittedSubtrees [
	"Answer the value of permittedSubtrees"

	^ permittedSubtrees
]

{ #category : #accessing }
X509NameConstraints >> permittedSubtrees: anObject [
	"Set the value of permittedSubtrees"

	permittedSubtrees := anObject
]
