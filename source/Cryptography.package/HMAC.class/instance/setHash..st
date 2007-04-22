initialization
setHash: aHash
	hash _ aHash.
	ipad _ ByteArray new: aHash blockSize withAll: 16r36.
	epad _ ByteArray new: aHash blockSize withAll: 16r5C