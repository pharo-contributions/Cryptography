as yet unclassified
cipherWithPassphrase: aString
	| cipher |
	cipher := OpenPGPPacket symmetricKeyAlgorithmFor: algorithm.
	cipher setKey: (s2kSpecifier stringToKey: aString numBytes: cipher keySize).
	^cipher