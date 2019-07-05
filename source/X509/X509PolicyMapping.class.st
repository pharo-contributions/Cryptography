Class {
	#name : #X509PolicyMapping,
	#superclass : #Object,
	#instVars : [
		'issuerDomainPolicy',
		'subjectDomainPolicy'
	],
	#category : 'X509-Extensions'
}

{ #category : #accessing }
X509PolicyMapping >> issuerDomainPolicy [
	"Answer the value of issuerDomainPolicy"

	^ issuerDomainPolicy
]

{ #category : #accessing }
X509PolicyMapping >> issuerDomainPolicy: anObject [
	"Set the value of issuerDomainPolicy"

	issuerDomainPolicy := anObject
]

{ #category : #accessing }
X509PolicyMapping >> subjectDomainPolicy [
	"Answer the value of subjectDomainPolicy"

	^ subjectDomainPolicy
]

{ #category : #accessing }
X509PolicyMapping >> subjectDomainPolicy: anObject [
	"Set the value of subjectDomainPolicy"

	subjectDomainPolicy := anObject
]
