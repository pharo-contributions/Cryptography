"
This class stores algorithm-specific data for RSA encryption keys in OpenPGP.
Its single MPI is m**e mod n.
"
Class {
	#name : #OpenPGPRSAData,
	#superclass : #OpenPGPPublicKeyAlgorithmData,
	#category : 'OpenPGP-Core'
}

{ #category : #accessing }
OpenPGPRSAData >> numMPIs [
	^2
]
