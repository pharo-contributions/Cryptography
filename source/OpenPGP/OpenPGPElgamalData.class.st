"
This class stores algorithm-specific data for Elgamal encryption keys in OpenPGP.
Its MPIs are g**k mod p and m * y**k mod p
"
Class {
	#name : #OpenPGPElgamalData,
	#superclass : #OpenPGPPublicKeyAlgorithmData,
	#category : 'OpenPGP-Core'
}

{ #category : #accessing }
OpenPGPElgamalData >> numMPIs [
	^3
]
