"
Instances of this class hold parameter data for public key algorithms. Since the algorithms known to OpenPGP all use a number of large integers (MPIs in OpenPGP parlance) an instance variable for these is defined in this class. At the moment, subclasses only differ by the number of MPIs stored.

Instance Variables:
mpis	<Array of: LargePositiveInteger>	MPIs for this algorithm
"
Class {
	#name : #OpenPGPPublicKeyAlgorithmData,
	#superclass : #Object,
	#instVars : [
		'mpis'
	],
	#category : 'OpenPGP-Core'
}

{ #category : #'instance creation' }
OpenPGPPublicKeyAlgorithmData class >> forPGPAlgorithmID: anInteger [
	(anInteger between: 1 and: 3) ifTrue: [^OpenPGPRSAData new].
	anInteger = 16 ifTrue: [^OpenPGPElgamalData new].
	anInteger = 17 ifTrue: [^OpenPGPDSAData new].
	anInteger = 20 ifTrue: [^OpenPGPElgamalData new].
	self error: 'PGP algorithm ', anInteger printString, ' is not yet supported'
]

{ #category : #accessing }
OpenPGPPublicKeyAlgorithmData >> mpis [
	^mpis
]

{ #category : #accessing }
OpenPGPPublicKeyAlgorithmData >> numMPIs [
	self subclassResponsibility
]

{ #category : #accessing }
OpenPGPPublicKeyAlgorithmData >> publicKey [
	self subclassResponsibility
]

{ #category : #reading }
OpenPGPPublicKeyAlgorithmData >> readFrom: aStream [
	mpis := (1 to: self numMPIs) collect: [:i | aStream nextMPI]
]
