"
This class stores algorithm-specific data for DSA signature keys in OpenPGP.
Its MPIs are p, q, g, and y.
"
Class {
	#name : #OpenPGPDSAData,
	#superclass : #OpenPGPPublicKeyAlgorithmData,
	#category : 'OpenPGP-Core'
}

{ #category : #accessing }
OpenPGPDSAData >> numMPIs [
	^4
]
