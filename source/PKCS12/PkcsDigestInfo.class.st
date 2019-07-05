Class {
	#name : #PkcsDigestInfo,
	#superclass : #Object,
	#instVars : [
		'digestAlgorithm',
		'digest'
	],
	#category : 'PKCS12'
}

{ #category : #accessing }
PkcsDigestInfo >> digest [
	"Answer the value of digest"

	^ digest
]

{ #category : #accessing }
PkcsDigestInfo >> digest: anObject [
	"Set the value of digest"

	digest := anObject
]

{ #category : #accessing }
PkcsDigestInfo >> digestAlgorithm [
	"Answer the value of digestAlgorithm"

	^ digestAlgorithm
]

{ #category : #accessing }
PkcsDigestInfo >> digestAlgorithm: anObject [
	"Set the value of digestAlgorithm"

	digestAlgorithm := anObject
]
