accessing
decrypt: aValue
	| imageKey |
	imageKey := SHA256 new hashMessage: SmalltalkImageInstanceID instanceID.
	^((TripleDES new 
		key: (imageKey asByteArray copyFrom: 1 to: (TripleDES blockSize * 3));
		cbc)
		initialVector: (imageKey asByteArray copyFrom: (TripleDES blockSize * 3) + 1 to: (TripleDES blockSize * 4));
		decrypt: aValue) asInteger