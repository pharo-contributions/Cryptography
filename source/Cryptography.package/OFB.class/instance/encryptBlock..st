accessing
encryptBlock: aByteArray
	self advanceVector.
	aByteArray withIndexDo:
		[ : eachByte : x |
		aByteArray 
			at: x
			put: ((aByteArray at: x) bitXor: (vector at: x)) ]