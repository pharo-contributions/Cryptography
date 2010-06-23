initialization
setHash: aHash
	hash := aHash.
	ipad := ByteArray new: aHash blockSize withAll: 16r36.
	epad := ByteArray new: aHash blockSize withAll: 16r5C