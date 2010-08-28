accessing
nextPutAll: aString
	buffer := (buffer copyFrom: startPos to: endPos), aString.
	startPos := 1.
	endPos := buffer size