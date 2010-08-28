stack
headerForChunk: chunk

	| size byteStream |
	byteStream := (ByteArray new: self headerSize) writeStream.
	size := chunk size.
	1 to: self headerSize do: [:i | byteStream nextPut: (size digitAt: self headerSize+1-i)].
	^ byteStream contents
