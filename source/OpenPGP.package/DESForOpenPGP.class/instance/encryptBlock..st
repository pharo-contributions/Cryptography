encryption/decryption
encryptBlock: anInteger
	| permuted encoded |
	permuted := IP permute: anInteger.
	encoded := self coreProcess: permuted forward: true.
	^IIP permute: encoded