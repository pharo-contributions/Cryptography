encryption/decryption
decryptBlock: anInteger
	| permuted encoded |
	permuted := IP permute: anInteger.
	encoded := self coreProcess: permuted forward: false.
	^IIP permute: encoded