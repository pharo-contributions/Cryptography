accessing
encryptBlock: aByteArray
	| kSubI |
	kSubI := self nextBlock.
	aByteArray withIndexDo:
		[ : eachByte : x |
		aByteArray 
			at: x
			put: (eachByte bitXor: (kSubI at: x)).
		"reduce leakage"
		kSubI at: x put: 0 ]