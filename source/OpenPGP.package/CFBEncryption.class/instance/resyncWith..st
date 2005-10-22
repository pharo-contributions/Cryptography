initialize-release
resyncWith: aByteArray
	iv := aByteArray copy.
	shiftData := ByteArray new: shiftData size.
	shiftIndex := 0