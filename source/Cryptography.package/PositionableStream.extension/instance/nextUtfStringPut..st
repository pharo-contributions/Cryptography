*cryptography-core
nextUtfStringPut: s 

	self uint16: s size.
	self nextPutAll: s asByteArray.
