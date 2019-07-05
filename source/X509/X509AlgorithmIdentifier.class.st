Class {
	#name : #X509AlgorithmIdentifier,
	#superclass : #Object,
	#instVars : [
		'oid',
		'parameters',
		'hasParameters'
	],
	#category : 'X509'
}

{ #category : #'instance creation' }
X509AlgorithmIdentifier class >> oid: oid [

	^ self new
		oid: oid;
		yourself
]

{ #category : #'instance creation' }
X509AlgorithmIdentifier class >> oid: oid parameters: params [

	^ self new
		oid: oid;
		parameters: params;
		yourself
]

{ #category : #'instance creation' }
X509AlgorithmIdentifier class >> oidString: oidString [

	^ self oid: (ASN1ObjectId fromString: oidString).

]

{ #category : #'instance creation' }
X509AlgorithmIdentifier class >> oidString: oidString parameters: params [

	^ self oid: (ASN1ObjectId fromString: oidString) parameters: params.

]

{ #category : #accessing }
X509AlgorithmIdentifier >> hasParameters [
	"Answer the value of hasParameters"

	^ hasParameters
]

{ #category : #accessing }
X509AlgorithmIdentifier >> hasParameters: anObject [
	"Set the value of hasParameters"

	hasParameters := anObject
]

{ #category : #'initialize-release' }
X509AlgorithmIdentifier >> initialize [

	self hasParameters: false.
]

{ #category : #testing }
X509AlgorithmIdentifier >> isDSA [

	^ self oid oid = '1.2.840.10040.4.1'

]

{ #category : #testing }
X509AlgorithmIdentifier >> isRSA [

	^ self oid oid = '1.2.840.113549.1.1.1'

]

{ #category : #testing }
X509AlgorithmIdentifier >> isTripleDESCBC [

	^ self oid oid = '1.2.840.113549.3.7'

]

{ #category : #accessing }
X509AlgorithmIdentifier >> oid [
	"Answer the value of oid"

	^ oid
]

{ #category : #accessing }
X509AlgorithmIdentifier >> oid: anObject [
	"Set the value of oid"

	oid := anObject
]

{ #category : #accessing }
X509AlgorithmIdentifier >> parameters [
	"Answer the value of parameters"

	^ parameters
]

{ #category : #accessing }
X509AlgorithmIdentifier >> parameters: anObject [
	"Set the value of parameters"

	self hasParameters: true.
	parameters := anObject
]

{ #category : #printing }
X509AlgorithmIdentifier >> printOn: stream [

	super printOn: stream.
	stream nextPutAll: '('.
	stream nextPutAll: self oid asString.
	stream nextPutAll: ')'.

]
