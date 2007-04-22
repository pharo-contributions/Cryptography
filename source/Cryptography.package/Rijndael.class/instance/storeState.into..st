setup
storeState: anArray into: aByteArray
	anArray withIndexDo: [ :register :k | register storeInto: aByteArray at: (k-1)*4 + 1]