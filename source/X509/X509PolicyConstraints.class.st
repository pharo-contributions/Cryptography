Class {
	#name : #X509PolicyConstraints,
	#superclass : #Object,
	#instVars : [
		'requireExplicitPolicy',
		'inhibitPolicyMapping'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509PolicyConstraints >> inhibitPolicyMapping [
	"Answer the value of inhibitPolicyMapping"

	^ inhibitPolicyMapping
]

{ #category : #accessing }
X509PolicyConstraints >> inhibitPolicyMapping: anObject [
	"Set the value of inhibitPolicyMapping"

	inhibitPolicyMapping := anObject
]

{ #category : #accessing }
X509PolicyConstraints >> requireExplicitPolicy [
	"Answer the value of requireExplicitPolicy"

	^ requireExplicitPolicy
]

{ #category : #accessing }
X509PolicyConstraints >> requireExplicitPolicy: anObject [
	"Set the value of requireExplicitPolicy"

	requireExplicitPolicy := anObject
]
